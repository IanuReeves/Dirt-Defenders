extends Part

@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	player.boosted.connect(boosted)

func _process(delta: float) -> void:
	pass

func boosted():
	if player.dashed:
		audio.play()
