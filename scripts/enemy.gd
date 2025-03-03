extends CharacterBody2D
@onready var pathfinding := $NavigationAgent2D as NavigationAgent2D
enum STATE {HUNTING, ATTACKING}
@export var state:STATE
@export var stats:EnemyStats
var SPEED:float = 500
@export var target:Player

func _physics_process(delta: float) -> void:
	var dir = to_local(pathfinding.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()

func is_player(body):
	return body is Player

func sort_vector(a:Vector2,b:Vector2):
	if a.length() > b.length():
		return true
	return false

func makepath() -> void:
	pathfinding.target_position = target.position
		
		


func _on_timer_timeout() -> void:
	makepath()
