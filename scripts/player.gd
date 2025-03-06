extends CharacterBody2D
class_name Player

var current_stats:PlayerStats = PlayerStats.new()
@export var parts:PartHandler
@export var health:HealthComponent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_stats = parts.stats
	health.max = current_stats.max_hp
	health.current = current_stats.max_hp
func _process(delta: float) -> void:
	current_stats = parts.stats
	health.max = current_stats.max_hp
	$Sprite2D.texture = parts.hull.texture
func rotate_to_mouse() -> void:
	#smooth rotation stol--ADAPTED from reddit
	# get vector from mouse to ship
	var v = (get_global_mouse_position() - global_position)
	# get angle of that vector
	var angle = v.angle()
	var r = global_rotation
	# get rotation allowed this frame
	var angle_delta = deg_to_rad(current_stats.rotation_speed) * get_physics_process_delta_time()
	# get complete rotation to ship
	angle = lerp_angle(r, angle, 0.3)
	# limit that rotation to what is allowed this frame
	angle = clamp(angle, r - angle_delta, r + angle_delta)
	# set rotation
	global_rotation = angle

func movement_input() -> void:
	if Input.is_action_pressed("forward"):
		# accelerate
		velocity += transform.x * current_stats.acceleration
		
	if Input.is_action_pressed("brake"):
		# subtract a fraction of base acceleration from current velocity
		var brake_mod = velocity.normalized()*Vector2(current_stats.acceleration*current_stats.brake_strength,current_stats.acceleration*current_stats.brake_strength)
		velocity -= brake_mod
	velocity = velocity.clampf(-current_stats.top_speed,current_stats.top_speed)
	
func _physics_process(delta: float) -> void:
	rotate_to_mouse()
	movement_input()
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		parts.fire_primary()

#Pause Menu
