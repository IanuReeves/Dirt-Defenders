extends CharacterBody2D
class_name Alien

@onready var detector: Detector = $Detector
var targeting : bool = false
var target : Node2D
var targetpos : Vector2
var targetangle 
var playerdir : Vector2


@onready var player : Player = get_parent().get_node("Player")

var state 

@export var stats : EnemyStats

func _physics_process(delta: float) -> void:
	if player:
		targetpos = player.position
		targetangle = position.angle_to(targetpos)
		playerdir = Vector2(cos(targetangle), sin(targetangle))
		velocity += playerdir
	move_and_slide()

func statecheck():
	if detector.targeting:
		state = attackstate()

func attackstate():
	velocity = detector.playerdir
	move_and_slide()
