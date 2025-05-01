extends AnimatedSprite2D

var playing : bool = false

func playexplosion():
	if playing == false:
		show()
		play()
		position.x = randf_range(25, -25)
		position.y = randf_range(25, -25)
		playing = true
	else:
		playing = false
		playexplosion()

func _ready() -> void:
	hide()

func _on_animation_finished() -> void:
	hide()
	position = Vector2(0,0)
