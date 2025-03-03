extends Area2D
class_name Projectile
@export var SPEED:float
@export var LIFETIME:float = 10
@export var damage:float
var time:float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta
	time += delta
	if time >= LIFETIME:
		time = 0
		queue_free()


func _on_area_entered(area: HitBoxComponent) -> void:
	area.damage(damage)
	queue_free()
