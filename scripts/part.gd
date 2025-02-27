extends Node2D
class_name Part

#WARNING: MUST BE ATTATCHED TO A STATE MACHINE BOUND TO A PLAYER 

var commander = get_parent()
var ingame : bool 
var inmenu : bool 
@export var icon : Sprite2D


@export var speed : float = 0
@export var attack : float = 0
@export var defense :float = 0
@export var turbo : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if commander is ASM:
		commander.checkstats()

func conditioncheck():
	if ingame:
		commander

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if commander == Player:
		ingame = true
		inmenu = false
	else:
		ingame = false
		inmenu = true 
