extends Projectile
class_name HomingProjectile


@export var radar: Radar 
@export var timer: Timer
@export var delay: float = 0 
@export var delaytimer: Timer
@export var isdelady:bool = false 


var slowed:bool = false
var target:Node2D 
var following : bool = false
var tracking : bool = true 
var rotationweight : float = 0


#determines how quickly it goes from it's original length to perfectly on target.

@export var rotspeed := 5

func _ready() -> void:
	if radar:
		radar.detected.connect(_on_detect)
	if timer:
		timer.timeout.connect(_on_timer_timeout)
	if delaytimer:
		delaytimer.timeout.connect(engage)
	initialize()

func _physics_process(delta: float) -> void:
	lifecheck()
	if (not following) and (not slowed):
		basicmovement()
	elif following:
		if target:
			position += transform.x * SPEED * delta 
			rotate_to_object(delta, target)
			
		else: 
			queue_free()
	elif slowed:
		position += transform.x * 40 * delta


func _on_timer_timeout() -> void:
	pierce -= 1
	if pierce >= 1:
		timer.start(2)


func _on_detect() -> void:
	if following == false:
		target = radar.get_nearest()
		if isdelady:
			delaytimer.start(delay)
			slowed = true
		else:
			slowed = true
			engage()


func engage():
		following = true 
		slowed = false

var rotaccuracy = 0

func rotate_to_object(delta:float, object:Node2D):
	if rotspeed < 100:
		rotspeed = clampf(rotspeed, 0, 100)
		var rot_to_set : float
		if rotaccuracy < 1:
			rotaccuracy += 0.01*rotspeed * delta
		rot_to_set = (global_position.angle_to_point(object.global_position))
		rotaccuracy = clampf(rotaccuracy, 0, 1)
		global_rotation = (lerp_angle(global_rotation, rot_to_set, rotaccuracy))
	else:
		look_at(target.global_position)
