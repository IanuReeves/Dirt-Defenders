extends Part
class_name DashPart
@onready var sign: GPUParticles2D = $GPUParticles2D

func _process(delta: float) -> void:
	if player.velocity.length() > 150: 
		stats.turbo_strength = 50
		sign.emitting = true 
	if player.dashed or player.velocity.length() < 200:
		stats.turbo_strength = 5
		sign.emitting = false
