extends Node
class_name HealthComponent

var max:float
var current:float:
	set(value):
		current = clamp(value, 0, max)
signal health_changed(amount:float,component:HealthComponent)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	current = max
func damage(amount:float):
	current -= amount
	health_changed.emit(amount,self)
	if current <= 0:
		if get_parent().has_method("die"):
			get_parent().die()

	
func heal(amount:float):
	damage(-amount)
