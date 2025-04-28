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
	pass

func _process(delta: float) -> void:
	if pierce < 1:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta
	time += delta
	if time >= LIFETIME:
		time = 0
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is HitBoxComponent:
		area.damage(damage)
		pierce -= 1
	if pierce >= 1 and pierceTimer.time_left == 0 and area is Projectile or HitBoxComponent:
				print("pierce decreased by "+str(area.get_class())+" on layer "+str(area.collision_layer))
				pierceTimer.one_shot = true
				add_child(pierceTimer)
				pierceTimer.start(.5)
	if area is Projectile and pierceTimer.time_left == 0:
		if area.get_path() != get_path():
			area.pierce -= 1
			pierce -= 1
			print("pierce reduced by projectile")
	else:
		pass
