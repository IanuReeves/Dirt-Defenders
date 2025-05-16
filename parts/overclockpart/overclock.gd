extends Special


var active:bool = false
var canFire:bool = true

@onready var decay: Timer = $decay
@onready var cooldowntimer: Timer = $cooldown

func _input(event: InputEvent) -> void:
	if event.is_action_pressed(keybind) and canFire and active == false:
		active = true 
		player.decay = false
		stats.attack = 50 
		stats.top_speed = 100
		stats.turbo_strength = 50
		stats.acceleration = 20
		decay.start()
	elif event.is_action_pressed(keybind):
		active = false
		canFire = false
		player.decay = true
		stats.attack = 0 
		stats.top_speed = 0
		stats.turbo_strength = 0
		stats.acceleration = 0
		decay.stop()




func _on_cooldown_timeout() -> void:
	canFire = true 
