extends Part
class_name Weapon

@export var bullet:PackedScene
@export var target_layer:int
@onready var rate_of_fire: Timer = $RateOfFire
@export var handler: Node2D


var canFire = true
signal fired
var keybind:String





func shoot(stats:PlayerStats):
	if canFire:
		for i in range(0,stats.bullet_amount):
			# create a bullet and modify it's stats based on input
			var b = bullet.instantiate()
			b.set_collision_mask_value(target_layer,true)
			b.origin = get_parent()
			b.damage = stats.attack
			b.position = global_position
			b.rotation = global_rotation + deg_to_rad(randf_range(-stats.bullet_spread/2,stats.bullet_spread/2))
			b.SPEED = stats.bullet_speed + handler.velocity.length()
			b.pierce = stats.pierce
			b.power = stats.power
			get_parent().get_parent().get_parent().add_child(b)
			canFire = false
	rate_of_fire.start(cooldown)

func _on_timer_timeout():
	canFire = true

func _ready() -> void:
	pass
