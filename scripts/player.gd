extends CharacterBody2D
class_name Player

@export var acceleration: float = 10.0
@export var weapon: Weapon
@export var top_speed:float = 200


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func movement_input() -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("forward"):
		velocity += transform.x * acceleration
	velocity = velocity.clampf(-top_speed,top_speed)

func _physics_process(delta: float) -> void:
	movement_input()
	print(velocity.length())
	move_and_slide()
	
