extends CharacterBody2D
class_name Enemy
@export var stats:EnemyStats
@export var health:HealthComponent
enum state {STALKING, ATTACKING}
func _ready() -> void:
	health.max = stats.max_hp
	health.current = stats.max_hp
