extends Part
class_name Weapon

@export var bullet:PackedScene
@export var target_layer:int
@onready var rate_of_fire: Timer = $RateOfFire

var canFire = true
signal fired

#fire bullet out of weapon
func fire
(target_layer:int,
speedmod:Vector2,
damage:float = stats.attack,
bullet_speed:float = 100,
bullet_amount:int = 1,
bullet_spread:float = 0, 
pierce:int = 0, 
power:float = 0, 
cooldown: float = 0):
	if canFire:
		shoot(target_layer,speedmod,damage,bullet_speed,bullet_amount,bullet_spread,pierce,power,cooldown)
		fired.emit()
		canFire = false

func shoot(target_layer:int,speedmod:Vector2,damage:float,bullet_speed:float,bullet_amount:int = 1,bullet_spread:float = 0, pierce:int = 0, power:float = 0, cooldown: float = 0):
		for i in range(0,bullet_amount):
			# create a bullet and modify it's stats based on input
			var b = bullet.instantiate()
			b.set_collision_mask_value(target_layer,true)
			b.damage = damage
			b.position = global_position
			b.rotation = global_rotation + deg_to_rad(randf_range(-bullet_spread/2,bullet_spread/2))
			b.SPEED = bullet_speed
			b.pierce = pierce
			b.power = power
			b.origin = self
			get_tree().root.add_child(b)
			rate_of_fire.start(cooldown)

func _on_timer_timeout():
	canFire = true

func _ready() -> void:
	pass
