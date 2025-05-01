extends Part

@onready var collision: Area2D = $Area2D
@onready var hitboxtimer: Timer = $Timer
@onready var fireplayer: AnimatedSprite2D = $fireplayer

var firepower = 10

var playervelocity
func _ready() -> void:
	player.boosted.connect(_on_boosted)


func _process(delta: float) -> void:
	if player.velocity.length() < 300:
		fireplayer.hide()
		collision.collision_mask = 8
		scale = Vector2(firepower/2,firepower/2)


func _on_cooldowntimer_timeout() -> void:
	cooltime -= 0.1
	

func _on_boosted(power):
	if cooltime == 0:
		fireplayer.show()
		hitboxtimer.start()
		collision.collision_mask = 2
		firepower = player.velocity.length()/300 + power/150






#this is what manages the hitboxes damage.

func _on_area_2d_area_entered(area: HitBoxComponent) -> void:
	if player:
		area.damage(player.stats.attack/2+ firepower)
