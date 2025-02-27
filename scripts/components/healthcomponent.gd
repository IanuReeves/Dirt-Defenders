extends Node
class_name HealthComponent

@export var max:float
var current:float:
	set(value):
		current = clamp(value, 0, max)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current = max

func damage(amount:float):
	current -= amount
	if current <= 0:
		if get_parent().has_method("die"):
			get_parent().die()
		else:
			get_parent().queue_free()
	
func heal(amount:float):
	damage(-amount)
