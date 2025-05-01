extends Part

@onready var beam: Area2D = $beam
@onready var duration: Timer = $duration
@onready var label: Label = $CanvasLayer/Label
@onready var cooldowntimer: Timer = $cooldown
@onready var cooldownlabel: Label = $CanvasLayer/cooldownlabel

var charge:float

func _input(event: InputEvent) -> void:
	if event.is_action_released("special") and charge > 100 and duration.time_left <= 0:
		if cooldowntimer.time_left <= 0:
			beam.collision_mask = 2
			beam.inputpower = charge
			duration.start()
			stats.rotation_speed = -150
			beam.scale.y = charge/40
			beam.scale.x = charge/130


func _process(delta: float) -> void:
	clampf(charge, 0, player.stats.power*10)
	if Input.is_action_pressed("special") and charge < (player.stats.power*10) and duration.time_left <= 0 and cooldowntimer.time_left <= 0:
		charge += (player.stats.power)/10
	label.text = "CHARGE: "+str(charge)
	if cooldowntimer.time_left:
		cooldownlabel.text = str(round(cooldowntimer.time_left))+" until ready to fire!"
	else:
		cooldownlabel.text = "ready to fire!"


func _on_duration_timeout() -> void:
	stats.rotation_speed = 0
	beam.scale.y = 0.5
	beam.scale.x = 0.2
	beam.inputpower = 0
	beam.collision_mask = 0
	cooldowntimer.start(8)
	charge = 0
	
	


func _on_damagetick_timeout() -> void:
	for object in beam.get_overlapping_bodies():
		if object is Alien:
			object.health.damage(beam.inputpower/2.5)
