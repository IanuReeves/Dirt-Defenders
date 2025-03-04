extends Part
func _process(delta: float) -> void:
	if get_parent() is PartHandler:
		var v = get_parent().get_velocity()
		if v.length() > 100:
			stats.damage = 100
		else:
			stats.damage = 0
