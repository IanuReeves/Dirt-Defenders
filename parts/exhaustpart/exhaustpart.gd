extends Part


func _ready() -> void:
	player.boosted.connect(_on_boosted)

func _process(delta: float) -> void:
	pass
	

func _on_cooldowntimer_timeout() -> void:
	cooldown -= 0.1
	
func _on_boosted():
	player.parts.fire_primary()
