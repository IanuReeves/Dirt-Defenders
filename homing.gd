extends Projectile
class_name HomingProjectile


@onready var radar: Radar = $Radar
@onready var timer: Timer = $Timer


var target
var following : bool = false


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	lifecheck()
	if not following:
		basicmovement()
	else:
		if target:
			rotate(get_angle_to(target.global_position))
			position += transform.x * 500 * delta

func _on_timer_timeout() -> void:
	pierce -= 1
	if pierce >= 1:
		timer.start(2)


func _on_detect() -> void:
	if following == false:
		target = radar.get_nearest()
		print(target)
		following = true
