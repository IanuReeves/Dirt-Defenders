extends Node2D
class_name Part
@export var stats:PlayerStats

var player:Player

@export var icon : ViewportTexture 
@export var descriptor : String


var cooldown : float = 0.0
# cooltime is the amount of cooldown time left, cooldown is the max cooltime. 
var cooltime : float 

func _ready() -> void:
	cooltime = cooldown

func _process(delta: float) -> void:
	clampf(cooltime, 0, cooldown)
