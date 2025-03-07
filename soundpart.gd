extends Part

@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _process(delta: float) -> void:
	if player.dashed:
		audio.play()
