extends Node2D
class_name Part
@export var stats:PlayerStats

@onready var parent = get_parent().get_parent()

var icon : Sprite2D
var player : Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if parent is Player:
		player = parent 
	elif parent == ItemList:
		player = null
