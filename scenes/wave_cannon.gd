extends Weapon


var charge : float 
@onready var chargetimer: Timer = $chargetimer

func _ready():
	pass
func _process(delta: float) -> void:
	pass



func _input(event: InputEvent) -> void: 
		if event.is_action_pressed(keybind):
			chargetimer.start()
			await chargetimer.timeout
			if charge < 5:
				charge += 1 
		if event.is_action_released(keybind):
			chargetimer.stop()
			stats.power += charge
			shoot(stats)
			player.recoil(50*charge)
			stats.power -= charge
			charge = 0
