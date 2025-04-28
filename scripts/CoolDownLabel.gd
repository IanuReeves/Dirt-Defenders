extends Label
class_name CoolDownLabel

var ability : Part

func _process(delta: float) -> void:
	text = str(name)+str(ability.cooltime)
	
