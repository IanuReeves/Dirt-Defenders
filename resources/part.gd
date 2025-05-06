extends Node2D
class_name Part


@export var stats:PlayerStats

var player:Player

@export var icon : ViewportTexture 
@export var descriptor : String



# IMPORTANT NOTES:
# ensure the player is there with an "if player" when referencing player
# DONT add an onready for the player. it breaks for some reason.
# the cooldown timer you attatch when making the scene MUST be called cooltimer.

@export var cooldown : float = 0.0
# cooltime is the amount of cooldown time left, cooldown is the max cooltime. 
var cooltime : float 

func _ready() -> void:
	cooltime = 0
	if get_parent().get_parent() is Player:
		player = get_parent().get_parent()
