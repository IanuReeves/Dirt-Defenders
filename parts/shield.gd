extends Auxiliary

@onready var shieldhealth: HealthComponent = $shieldhealth
@onready var shieldarea: HitBoxComponent = $shieldarea
@onready var label: Label = $CanvasLayer/Label
@onready var cooldowntimer: Timer = $cooldown

var shielding : bool = false




func _input(event: InputEvent) -> void:
	if event.is_action_pressed(keybind):
		pass

func activate():
	if cooldowntimer.time_left <= 0 and shielding == false:
		shielding = true
		show()
		shieldarea.collision_layer = 1
		shieldarea.collision_mask = 1
		shieldhealth.max = 100
		shieldhealth.current = shieldhealth.max
		used.emit()


func die():
	shielding = false
	hide()
	shieldarea.collision_layer = 0
	cooldowntimer.start(cooldown)


func _ready() -> void:
	shielding = false
	hide()
	shieldarea.collision_layer = 0
	shieldarea.health_component = shieldhealth
	shieldhealth.max = 100
	shieldhealth.current = shieldhealth.max



func _on_timer_timeout() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if shielding:
		label.text = "shield health: "+str(shieldhealth.current)
	else:
		label.text = "shield cooldown: "+str(round(cooldowntimer.time_left))
