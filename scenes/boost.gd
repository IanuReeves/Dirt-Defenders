extends AnimatedSprite2D
@onready var timer: Timer = $Timer

func boost():
	play('boosting')
	timer.start(0.7)

func _ready() -> void:
	play('default')


func _on_timer_timeout() -> void:
	play('default')
