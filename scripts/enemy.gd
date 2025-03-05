extends CharacterBody2D
class_name Enemy
@export var stats:EnemyStats
@onready var health:HealthComponent = $HealthComponent
@export var planet:StaticBody2D
@export var target:Vector2 = Vector2(0,0)

enum STATES {PUSHING, STALKING}
@export var state:STATES

func _ready() -> void:
	health.max = stats.max_hp
	health.current = stats.max_hp

func sort_distance(a,b):
	if a.length() > b.length():
		return true
	return false

func _processasss(delta: float) -> void:
	var targets = Array()
	if $Area2D.get_overlapping_bodies().filter(is_player).size() > 0:
		for body in $Area2D.get_overlapping_bodies().filter(is_player):
			targets.append(body.position)
		if targets.size() > 0:
			targets.sort_custom(sort_distance)
			target = to_local(targets[0])
	else:
		target = to_local(position)

func is_player(value):
	if value is Player:
		return true
	return false

func _physics_process(delta: float) -> void:
	look_at(target)
	if position.distance_to(target) > stats.desired_target_distance:
		if position.distance_to(target) < stats.speed:
			velocity = transform.x * position.distance_to(target)
		else:
			velocity = transform.x * stats.speed
