extends Part


func _process(delta: float) -> void:
	if player.boosted: 
		get_parent().fire_primary()

func _on_cooldowntimer_timeout() -> void:
	cooldown -= 0.1
