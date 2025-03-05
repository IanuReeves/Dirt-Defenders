extends Area2D
class_name GravityWell

@export var strength:float = 10.0
@export var size:float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#$CollisionShape2D.shape.radius = size

func _physics_process(delta: float) -> void:
	for body in get_overlapping_bodies():
		if body is Player:
			body.velocity += strength * body.global_position.direction_to(to_global(position))
