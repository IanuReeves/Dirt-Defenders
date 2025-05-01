extends Weapon


func _ready():
	pass
func _process(delta: float) -> void:
	pass



func _on_fired() -> void:
	player.recoil(80)
