extends Area2D
class_name HitBoxComponent

@onready var HBshape = $HBshape
@export var health_component:HealthComponent
@export var iFrameTimer:Timer = Timer.new()

func _ready() -> void:
	iFrameTimer.one_shot = true
	iFrameTimer.autostart = false
	iFrameTimer.wait_time = .25
	add_child(iFrameTimer)


func damage(amount:float):
	if health_component:
		if !iFrameTimer.time_left > 0:
			health_component.damage(amount)
			iFrameTimer.start()
	
