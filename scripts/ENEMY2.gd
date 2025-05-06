extends CharacterBody2D
class_name Alien

var targeting : bool = false
var targetpos : Vector2
var targetangle  
var playerdir : Vector2

@onready var health : HealthComponent = $HealthComponent
@onready var invadetimer: Timer = $invadetimer
@onready var player : Player = get_parent().get_node("Player")
@onready var planet = get_parent().get_node("planet")

@onready var damagesign: AnimatedSprite2D = $damagesign
@onready var radar: Radar = $Radar
@onready var world = get_parent()
@onready var ind: ColorRect = $ColorRect

@export var weapon:Weapon 

var state
signal died
@export var stats : EnemyStats

func _physics_process(delta: float) -> void:
	#sets minimap mode indicator
	if world.camzoomed:
		ind.show()
	else: 
		ind.hide()
	#checks if the planet is close enough for the enemy to deal damage.
	if planet: 
		if planet.global_position.distance_to(global_position) < 150 and invadetimer.is_stopped():
			invadetimer.start(5)
	#performs assigned state variable.
	state.call()





func _ready() -> void:
	player = get_parent().get_node("Player")
	state = invadingstate



''' 
state variables are variables that contain functions, succh as the one below.
the states are called each physics process tick in order to do whatever is in 
the variables function. this can be looking at a player, moving towards the planet,
etc etc or even getting formation later down the line
'''



#simply moves towards player. triggered 
var chasingstate = func chasingstate():
	movetowards(player)

# checks if theres a planet, and if the planet is close enough it moves towards it.
var invadingstate = func invadingstate():
		if planet:
			movetowards(planet)
	# this checks if the enemy is 10 pixels away from the planet's radius 
	# NOTE: THIS PART IS WIP ^^^



var shootstate = func shootstate() -> void:
	velocity = Vector2(0,0)
	var playerdist = player.global_position.distance_to(global_position)
	look_at(player.global_position + (player.velocity * playerdist/stats.bullet_speed) * randf_range((stats.accuracy/100),1))
	# get angle of that vectors
	weapon.fire()

func movetowards(target) -> void:
	if target:
		targetangle = global_position.direction_to(target.global_position)
		velocity = targetangle*stats.speed
		look_at(target.global_position)
		move_and_slide()
	else:
		pass

func _on_timer_timeout() -> void:
	weapon.canFire = true



func _on_radar_detected() -> void:
	state = chasingstate

func _on_radar_exited(objectexited: Node2D) -> void:
	state = invadingstate

func _on_range_detected() -> void:
	state = shootstate

func _on_range_exited(objectexited: Node2D) -> void:
	state = chasingstate


''' 
this area of code handles all the dying. the damagesign plays an 
animation, the invadetimer timeout damages the planet, then it plays an 
explosion and dies. m

the die function is called by the health component.
'''


func die():
	damagesign.playexplosion()
	await damagesign.animation_finished
	world.score+=15
	queue_free()

func _on_health_component_damaged() -> void:
	damagesign.playexplosion()
	state = chasingstate


func _on_invadetimer_timeout() -> void:
	planet.damage(stats.attack)
	damagesign.playexplosion()
	await damagesign.animation_finished
	die()
