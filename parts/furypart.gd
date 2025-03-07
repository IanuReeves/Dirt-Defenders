extends Part


func _process(delta: float) -> void:
	if player.turbo > 100:
		stats.attack = 50 
		stats.bullet_amount = 3
	else:
		stats.attack = 10
		stats.bullet_amount = 1 
