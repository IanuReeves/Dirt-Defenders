extends Area2D
class_name Projectile
@export var SPEED:float
@export var LIFETIME:float = 1000
@export var damage:float
@export var power: float
@export var block: bool
@export var origin : Node

var time:float = 0
var pierce:int
var pierceTimer = Timer.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_collision_mask_value(3, true)
	set_collision_layer_value(3, true)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	basicmovement()

func basicmovement():
	position += transform.x * SPEED * get_physics_process_delta_time()
	time += get_physics_process_delta_time()
	if time >= LIFETIME:
		time = 0
		queue_free()
	if pierce < 1:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area is HitBoxComponent:
		area.damage(damage)
		pierce -= 1
	if pierce >= 1 and pierceTimer.time_left == 0 and area is HitBoxComponent:
				pierceTimer.one_shot = true
				add_child(pierceTimer)
				pierceTimer.start(.5)
	if area is Projectile and pierceTimer.time_left == 0:
			if block:
				area.pierce -= 1
				pierce -= 1
				print("pierce reduced by projectile")
	else:
		pass
