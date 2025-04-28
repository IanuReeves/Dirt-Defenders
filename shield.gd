extends Part

@onready var shieldhealth: HealthComponent = $shieldhealth
@onready var shieldarea: HitBoxComponent = $shieldarea
@onready var label: Label = $CanvasLayer/Label
@onready var cooldowntimer: Timer = $cooldown

var shielding : bool = false



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("aux") and cooldowntimer.time_left <= 0 and shielding == false:
		shielding = true
		shieldarea.show()
		shieldarea.collision_layer = 1
		shieldarea.collision_mask = 1
		shieldhealth.max = 100
		shieldhealth.current = shieldhealth.max
		print(shieldhealth.current)

func die():
	shielding = false
	shieldarea.hide()
	shieldarea.collision_layer = 0
	cooldowntimer.start(cooldown)
	print("shield deactivated!")

func _ready() -> void:
	shieldarea.health_component = shieldhealth
	shieldhealth.max = 100
	shieldhealth.current = shieldhealth.max
	die()


func _on_timer_timeout() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	label.text = str(shieldhealth.current)
