extends Node2D
class_name EnemySpawner
var BasicEnemy = preload("res://scenes/enemy.tscn")
@export var world:Node2D 
@export var Enemy : PackedScene
@export var spawn_by_time : bool


func spawn(enemy:PackedScene):
		var e = enemy.instantiate()
		e.position = position
		world.add_child(e)
		

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("spawn"):
		Spawn_def()
func Spawn_def():
	spawn(BasicEnemy)

func _on_timer_timeout() -> void:
	if spawn_by_time:
		spawn(BasicEnemy)
