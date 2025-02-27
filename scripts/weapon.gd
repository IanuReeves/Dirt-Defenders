extends Node2D
class_name Weapon

@export var bullet:PackedScene
@export var damage:float
@export var target_layer:int
#fire bullet out of weapon
func fire(speedmod:Vector2):
	var b = bullet.instantiate()
	b.set_collision_mask_value(target_layer,true)
	b.damage = damage
	b.position = global_position
	b.rotation = global_rotation
	b.SPEED += speedmod.length()
	get_tree().root.add_child(b)
