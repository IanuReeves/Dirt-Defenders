extends StaticBody2D
class_name Planet

@onready var health = $HealthComponent
@onready var healthind: Label = $CanvasLayer/Label
@onready var shape: CollisionShape2D = $Area2D/CollisionShape2D
const DEATHSCREEN = preload("res://scenes/deathscreen.tscn")

func die() -> void:
	get_tree().change_scene_to_packed(DEATHSCREEN)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	healthind.text = str(health.current)


func _on_body_touched(area: Area2D) -> void:
	if area is Projectile:
		area.queue_free()

func damage(attack):
	health.damage(attack)
