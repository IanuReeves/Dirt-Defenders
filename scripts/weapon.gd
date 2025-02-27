extends Node2D
class_name Weapon

@export var bullet:PackedScene

var speed : int = 0
var attack : int = 20
var defense : int = 20
var turbo : int = 5

#fire bullet out of weapon

func fire(speedmod:Vector2):
	var b = bullet.instantiate()
	b.position = global_position
	b.rotation = global_rotation
	b.SPEED += speedmod.length()
	get_tree().root.add_child(b)
