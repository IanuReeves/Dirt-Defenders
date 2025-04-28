extends CharacterBody2D
class_name Alien

var targeting : bool = false
var targetpos : Vector2
var targetangle  
var playerdir : Vector2


@onready var invadetimer: Timer = $invadetimer
@onready var player : Player = get_parent().get_node("Player")
@onready var planet = get_parent().get_node("planet")
@onready var weapon: Weapon = $enemyweapon



var state 
@export var stats : EnemyStats

func _physics_process(delta: float) -> void:
	player = get_parent().get_node("Player")
	statecheck()

func _ready() -> void:
	weapon.target_layer = 1
	
	invadingstate()


func statecheck():	
	if player:
		if player.position.distance_to(position) < stats.detect_range:
			if player.position.distance_to(position) <= stats.desired_target_distance:
				shootstate()
			else:
				chasingstate()
		elif player.position.distance_to(position) > stats.detect_range:
			invadingstate()

func chasingstate():
	movetowards(player)
	invadetimer.stop()
	if player.position.distance_to(position) > stats.detect_range or player.position.distance_to(position) <= stats.desired_target_distance:
		statecheck()


# checks if theres a planet, and if the planet is close enough it moves towards it.
func invadingstate():
		if planet and planet.position.distance_to(position) <= stats.desired_target_distance:	
			movetowards(planet)
	# this checks if the enemy is 10 pixels away from the planet's radius 
	# NOTE: THIS PART IS WIP ^^^
		if planet and planet.position.distance_to(position) < 150:
			planet.damage(stats.attack)
			die()
func die():
	queue_free()


func shootstate() -> void:
	velocity = Vector2(0,0)
	look_at(player.position + player.velocity/PI)
	# get angle of that vectors
	weapon.fire(1,Vector2(0,0),stats.attack,stats.bullet_speed, 1, 1, 1, 1, 1.25)

func movetowards(target) -> void:
	if target:
		targetpos = to_local(target.position)
		targetangle = position.direction_to(target.position)
		velocity = targetangle*stats.speed
		look_at(target.position)
		move_and_slide()
	else:
		pass

func _on_timer_timeout() -> void:
	weapon.canFire = true


func _on_invadetimer_timeout() -> void:
	pass
