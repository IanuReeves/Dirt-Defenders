extends CharacterBody2D
class_name Alien

@onready var detector: Detector = $Detector
var targeting : bool = false
var targetpos : Vector2
var targetangle 
var playerdir : Vector2


@onready var player : Player = get_parent().get_node("Player")
@onready var planet = get_parent().get_node("planet")


var state 
@export var stats : EnemyStats

func _physics_process(delta: float) -> void:
	statecheck()


func statecheck():	
	if player.position.distance_to(position) < stats.detect_range:
		chasingstate()
	elif player.position.distance_to(position) > stats.detect_range:
		invadingstate()


func chasingstate():
	movetowards(player)
	if player.position.distance_to(position) > stats.detect_range:
		statecheck()
func invadingstate():
	movetowards(planet)

func movetowards(target) -> void:
	targetpos = to_local(target.position)
	targetangle = position.direction_to(target.position)
	velocity = targetangle*stats.speed
	move_and_slide()
