extends CharacterBody2D
class_name Player


@onready var SM = $STATEMACHINE
@onready var UI = $UIL/UI
@onready var primary: Weapon = $Weapon1
@onready var secondary : Weapon = $Weapon2


var speed : float
var attack : float
var defense : float
var turboboost : float
var accelboost : float
var handling : float 
#onready to ensure SM loads it's parts first

func STATCHECK():
	speed = SM.speed
	attack = SM.attack
	defense = SM.defense 
	turboboost = SM.turboboost 
	handling = SM.handling
	accelboost = SM.accelboost



@export var acceleration: float = 7.0
@export var top_speed:float = 400
@export var rotation_speed:float = 200

var vel : int
var turbo : int
var maxturbo = 500
func UIupdate():
	UI.turbo = turbo
	UI.speed = speed
	UI.vel = int(velocity.length())
	UI.attack = attack
	UI.defense = defense


# Calledwhen the node enters the scene tree for the first time.
func _ready() -> void:
	print(attack)

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
		velocity += transform.x * acceleration
	if Input.is_action_pressed("brake"):
		velocity -= velocity.normalized()*Vector2(acceleration/1.75,acceleration/1.75)
		velocity = velocity.clampf(-top_speed,top_speed)
		if int(velocity.length()) > 0: 
			turbo += 1

func _physics_process(delta: float) -> void:
	rotate_to_mouse()
	movement_input()
	turbo = clamp(turbo,0,maxturbo)
	move_and_slide()
	vel = int(velocity.length())
	UIupdate()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("fire"):
		primary.fire(velocity)


func _on_tickdown_timeout() -> void:
	turbo -= 1
