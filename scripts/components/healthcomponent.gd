extends Node
var MAX_HP:float = 100
var current_hp:float:
	set(value):
		current_hp = clamp(value, 0, MAX_HP)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_hp = MAX_HP

func damage(amount:float):
	current_hp -= amount
	
func heal(amount:float):
	damage(-amount)
