extends Projectile

var sizemult:float = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _process(delta: float) -> void:
	if sizemult < (power/30):
		sizemult *= 1 + (power/2000)
	scale.y = sizemult
	scale.x = sizemult/2


func _ready() -> void:
	animated_sprite_2d.modulate = Color(0.3, 0.3, 0.3, 1)
	
