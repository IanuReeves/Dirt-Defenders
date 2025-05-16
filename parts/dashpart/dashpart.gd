extends Part
@onready var sign: CPUParticles2D = $CPUParticles2D
@onready var boosttime: Timer = $boosttime
@onready var canUse : bool = true
var boosting:bool =false
var charge:float
var dashpower:float
func _ready() -> void:
	sign.emitting = false
	player.dashed.connect(dashed)


func _process(delta: float) -> void:
	cooltime = cooldowntimer.time_left
	charge = int(boosttime.time_left)

func dashed():
	if (player.velocity.length() > 300) and canUse:
		stats.top_speed = 200
		stats.attack = 30
		canUse = false
		boosttime.start(5)

func _on_boosttime_timeout() -> void:
	cooldowntimer.start(cooldown)
	stats.top_speed = 50
	stats.attack = 10


func _on_cooldowntimer_timeout() -> void:
	canUse = true
