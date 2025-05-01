extends Part

@onready var collision: Area2D = $Area2D
@onready var hitboxtimer: Timer = $Timer
@onready var fireplayer: AnimatedSprite2D = $fireplayer


var playervelocity
func _ready() -> void:
	player.boosted.connect(_on_boosted)


func _process(delta: float) -> void:
	if player.velocity.length() < 300:
		fireplayer.hide()
		collision.collision_mask = 8
		scale *= player.velocity.length()/150


func _on_cooldowntimer_timeout() -> void:
	cooltime -= 0.1
	

func _on_boosted():
	if cooltime == 0:
		fireplayer.show()
		hitboxtimer.start()
		collision.collision_mask = 2





#this is what manages the hitboxes damage.

func _on_area_2d_area_entered(area: HitBoxComponent) -> void:
	if player:
		area.damage(player.stats.attack+player.velocity.length())
