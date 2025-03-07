extends Node2D
class_name EnemySpawner
@export var enemy = preload("res://scenes/enemy.tscn")
@export var world:Node2D


func _on_timer_timeout() -> void:
	var e = enemy.instantiate()
	world.add_child(e)
