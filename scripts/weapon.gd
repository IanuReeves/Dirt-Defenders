extends Node2D
class_name Weapon

@export var bullet:PackedScene
#fire bullet out of weapon
func fire(speedmod:Vector2):
	var b = bullet.instantiate()
	b.position = global_position
	b.rotation = global_rotation
	b.SPEED += speedmod.length()
	get_tree().root.add_child(b)
