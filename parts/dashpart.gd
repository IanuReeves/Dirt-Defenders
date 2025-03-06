extends Part
class_name DashPart
@onready var sign: GPUParticles2D = $GPUParticles2D

func _ready() -> void:
	cooldown = 0
func _process(delta: float) -> void:
	if player.velocity.length() > 150: 
		stats.turbo_cooldown = -2
		stats.turbo_strength = 50
		sign.emitting = true 
	if player.dashed or player.velocity.length() < 200:
		stats.turbo_strength = 0
		stats.turbo_cooldown = 0
		sign.emitting = false
