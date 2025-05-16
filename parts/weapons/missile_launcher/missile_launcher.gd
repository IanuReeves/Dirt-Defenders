extends Weapon

var charge:float = 0 
var roundcount:int = 0
var readied: bool = true 


func _process(delta: float) -> void:
	if cooldowntimer:
		cooltime = cooldowntimer.time_left
	if charge < player.stats.power and Input.is_action_pressed(keybind):
		charge += player.stats.power/50



func _input(event: InputEvent) -> void:
	if event.is_action_released(keybind) and charge > 10:
		stats.bullet_amount = int(charge/25)
		stats.power = player.stats.power+10
		roundcount = int(charge/100)
		for i in roundcount:
			rate_of_fire.start(0.5)
			await rate_of_fire.timeout
			shoot(stats)
		readied = false
		cooldowntimer.start(cooldown)
		charge = 0
		stats.power = 30
		stats.bullet_amount = 0





func _on_cooldowntimer_timeout() -> void:
	readied = true 
