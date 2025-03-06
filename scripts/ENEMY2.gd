extends CharacterBody2D
class_name Alien

@onready var detector: Detector = $Detector
var targeting : bool = false
var targetpos : Vector2
var targetangle 
var playerdir : Vector2


@onready var player : Player = get_parent().get_node("Player")
@onready var planet = get_parent().get_node("planet")
@onready var weapon = $Weapon


var state 
@export var stats : EnemyStats

func _physics_process(delta: float) -> void:
	statecheck()


func statecheck():	
	if player.position.distance_to(position) < stats.detect_range:
		if player.position.distance_to(position) <= stats.desired_target_distance:
			shootstate()
		else:
			chasingstate()
	elif player.position.distance_to(position) > stats.detect_range:
		invadingstate()


func chasingstate():
	movetowards(player)
	if player.position.distance_to(position) > stats.detect_range or player.position.distance_to(position) <= stats.desired_target_distance:
		statecheck()
func invadingstate():
	movetowards(planet)

func shootstate() -> void:
	velocity = Vector2(0,0)
	look_at((sqrt(player.velocity.length())*(player.velocity.normalized()))+player.position)
	# get angle of that vectors
	if $Timer.time_left <= 0:
		weapon.fire(5,Vector2(0,0),stats.attack,stats.bullet_speed)
		$Timer.start()

func movetowards(target) -> void:
	targetpos = to_local(target.position)
	targetangle = position.direction_to(target.position)
	velocity = targetangle*stats.speed
	move_and_slide()
