extends CharacterBody2D
class_name Player

#weapon stats
@export var weapon: Weapon
@export var power:float
@export var attack:float
@export var bullet_speed:float
@export var bullet_spread:float
#movement stats
@export var acceleration: float = 7.0
@export var top_speed:float = 400
@export var brake_strength:float = .25
@export var max_turbo:float
@export var rotation_speed:float = 200
#other stats
@export var defense:float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func rotate_to_mouse() -> void:
	#smooth rotation stol--ADAPTED from reddit
	# get vector from mouse to ship
	var v = (get_global_mouse_position() - global_position)
	# get angle of that vector
	var angle = v.angle()
	var r = global_rotation
	# get rotation allowed this frame
	var angle_delta = deg_to_rad(rotation_speed) * get_physics_process_delta_time()
	# get complete rotation to ship
	angle = lerp_angle(r, angle, 0.3)
	# limit that rotation to what is allowed this frame
	angle = clamp(angle, r - angle_delta, r + angle_delta)
	# set rotation
	global_rotation = angle

func movement_input() -> void:
	if Input.is_action_pressed("forward"):
		# accelerate
		velocity += transform.x * acceleration
		
	if Input.is_action_pressed("brake"):
		# subtract a fraction of base acceleration from current velocity
		var brake_mod = velocity.normalized()*Vector2(acceleration*brake_strength,acceleration*brake_strength)
		velocity -= brake_mod
	velocity = velocity.clampf(-top_speed,top_speed)
	
func _physics_process(delta: float) -> void:
	rotate_to_mouse()
	movement_input()
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		weapon.fire(velocity)
