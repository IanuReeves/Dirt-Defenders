extends Projectile

var sizemult:float = 1


func _process(delta: float) -> void:
	if sizemult < (power/30):
		sizemult *= 1 + (power/2000)
	scale.y = sizemult
	scale.x = sizemult/2
