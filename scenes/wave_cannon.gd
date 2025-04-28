extends Weapon


func _ready():
	pass
func _process(delta: float) -> void:
	pass



func _on_fired() -> void:
	player.velocity.x -= 50
