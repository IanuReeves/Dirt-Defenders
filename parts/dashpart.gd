extends Part
class_name DashPart
@onready var sign: CPUParticles2D = $CPUParticles2D


func _ready() -> void:
	cooldown = 0
	sign.emitting = false
func _process(delta: float) -> void:
	if player.velocity.length() > 400: 
		stats.turbo_cooldown = -2
		stats.turbo_strength = 50
		sign.emitting = true 
	if player.boosted or player.velocity.length() < 375:
		stats.turbo_strength = 0
		stats.turbo_cooldown = 0
		sign.emitting = false
