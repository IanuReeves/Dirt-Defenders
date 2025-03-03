extends Area2D
class_name HitBoxComponent

@onready var HBshape = $HBshape
@export var health_component:HealthComponent

func damage(amount:float):
	if health_component:
		health_component.damage(amount)
