extends Part
@onready var sign: CPUParticles2D = $CPUParticles2D
@onready var boosttime: Timer = $boosttime


func _ready() -> void:
	cooldown = 0
	sign.emitting = false
	player.dashed.connect(dashed)


func _process(delta: float) -> void:
	if player.velocity.length() > 300: 
		stats.turbo_cooldown = -2
		stats.turbo_strength = 100
		stats.attack = 30
		sign.emitting = true 
	if player.velocity.length() < 250:
		boosttime.start
		stats.attack = 10
		stats.turbo_strength = 0
		stats.turbo_cooldown = 0
		sign.emitting = false
	

func dashed():
	boosttime.start
	stats.turbo_strength = 0
	stats.turbo_cooldown = 0
	sign.emitting = false
