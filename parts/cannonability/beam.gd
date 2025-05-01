extends Area2D

var inputpower:float = 0
@onready var animated_sprite_2d: AnimatedSprite2D = $CollisionShape2D/AnimatedSprite2D


func _process(delta: float) -> void:
	animated_sprite_2d.modulate = Color(0, 0, 1, 0.4,)
