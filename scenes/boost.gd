extends AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var player: Player = $"../.."



func _ready() -> void:
	player.dashed.connect(boost)

func boost():
	play("boosting")
	timer.start(1)
	show()


func _on_timer_timeout() -> void:
	play("default")
