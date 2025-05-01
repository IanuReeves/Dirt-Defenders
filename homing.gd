extends Projectile
class_name HomingProjectile
@onready var radar: Radar = $Radar
@onready var timer: Timer = $Timer

var target
var following : bool = false
func _ready() -> void:
	radar.detected.connect(on_detect)

func on_detect():
	if following == false:
		target = radar.get_nearest()
		print(target)
		following = true

func _physics_process(delta: float) -> void:
	if not following:
		basicmovement()
	else:
		rotate(get_angle_to(target.position))
		position.x += 10 * delta

func _on_timer_timeout() -> void:
	pierce -= 1
	if pierce >= 1:
		timer.start(2)
