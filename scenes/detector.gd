extends Node2D
class_name Detector

var targeting : bool = false
var target : Node2D
var targetpos : Vector2
var targetangle 
var playerdir : Vector2
@onready var player : Player = get_parent().get_node("Player")

func checkrays():
	pass

func _process(delta: float) -> void:
	pass

func track():
	if targeting == true:
		targetpos = target.position
		targetangle = position.angle_to(targetpos)
		playerdir = Vector2(cos(targetangle), sin(targetangle))
