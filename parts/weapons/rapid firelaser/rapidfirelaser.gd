extends Weapon

var shotstofire:int 
@onready var shoottimer: Timer = $shoottimer



func _on_fired() -> void:
	shotstofire = 10
	shoottimer.start()

func _process(delta: float) -> void:
	cooldown = shotstofire * 0.2

func _on_shoottimer_timeout() -> void:
	if shotstofire > 0:
		shoot(2,player.get_velocity(),player.stats.attack/3,1500,1,player.stats.bullet_spread, 1, player.stats.power)
		shotstofire -= 1 
