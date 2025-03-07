extends CharacterBody2D
class_name Player

var stats:PlayerStats = PlayerStats.new()
@export var parts:PartHandler
@export var health:HealthComponent
@onready var deathscreen: CanvasLayer = $deathscreen
@onready var world = get_parent()
const DEATHSCREEN = preload("res://scenes/deathscreen.tscn")
# turbo cooldown timer is no longer made in the player because fuck node shenanigains
# I guess player.gd used to be a mom now, all of it's other children are adopted, and this one was murdered
# she adopted another child to replace the hole in her heart
@onready var turbo_cooldown_timer: Timer = $TurboCooldown


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

# checks for actions:
# signal emitted on dash for ui shenanigains
signal dashed(cdtime:float)
signal boosted
# why the fuck does this exist, oh well
var accelerating : bool
# add "taken damage" action here -> already done (see health_changed signal in HealthComponent) 
# and a LOT is already handled by HealthComponent.damage() (also playerHP is stored in HealthComponent)
var turbo : float

# where else is this function used?? I question it's purpose
# it can't just be to divide turbo by two in this ONE SCRIPT that would be perposterous
func miniturbo():
	return turbo/2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# init health and stats so it doesn't scream at me
	stats = parts.stats
	health.max = stats.max_hp
	health.current = stats.max_hp
	# init turbo cooldown timer (please don't hate me)
func _process(delta: float) -> void:
	# update stats and health each frame
	stats = parts.stats
	health.max = stats.max_hp
func rotate_to_mouse() -> void:
	#smooth rotation stol--ADAPTED from reddit
	# get vector from mouse to ship
	var v = (get_global_mouse_position() - global_position)
	# get angle of that vector
	var angle = v.angle()
	var r = global_rotation
	# get rotation allowed this frame
	var angle_delta = deg_to_rad(stats.rotation_speed) * get_physics_process_delta_time()
	# get complete rotation to ship
	angle = lerp_angle(r, angle, 0.3)
	# limit that rotation to what is allowed this frame
	angle = clamp(angle, r - angle_delta, r + angle_delta)
	# set rotation
	global_rotation = angle

func movement_input() -> void:
	if Input.is_action_pressed("forward"):
		# accelerate
		velocity += transform.x * stats.acceleration
		accelerating = true
	if Input.is_action_just_released("forward"):
		accelerating = false
	if Input.is_action_pressed("brake"):
		# subtract brake strength*accel from velocity (in other words, brake)
		var brake_mod = velocity.normalized()*Vector2(stats.acceleration*stats.brake_strength,stats.acceleration*stats.brake_strength)
		velocity -= brake_mod
		# gain turbo
		if velocity.length() > 5 and not Input.is_action_pressed("forward"):
			turbo += 2.5
		elif velocity.length() < 5:
			velocity = Vector2(0,0) 
	velocity = velocity.clampf(-stats.top_speed,stats.top_speed)
	
func _physics_process(delta: float) -> void:
	rotate_to_mouse()
	movement_input()
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	# dash if cooldown isn't a little shit
	if event.is_action_released("dash") and turbo_cooldown_timer.time_left == 0:
		if turbo > 50:
			# why even add miniturbo to this?
			velocity += transform.x * ((stats.acceleration * 100) + miniturbo())
			# turbo /= 2 lol
			turbo -= miniturbo()
			# emit gui shenanigains
			dashed.emit(stats.turbo_cooldown)
			turbo_cooldown_timer.start(stats.turbo_cooldown)
			boosted.emit()
	if event.is_action_pressed("fire"):
		parts.fire_primary()

func _on_timer_timeout() -> void:
	if turbo > 0:
		turbo -= 1
		turbo = clamp(turbo, 0, INF)

func die():
	queue_free()
	get_tree().change_scene_to_packed(DEATHSCREEN)
