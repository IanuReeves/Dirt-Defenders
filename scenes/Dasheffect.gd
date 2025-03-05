extends Part



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not stats:
		stats = null
	player = get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.velocity.length() > 200:
		stats.attack = 30
	else:
		stats.attack = 10
	turbocheck()

func turbocheck():
	if player.turbo > 100:
		stats.acceleration = 100
	else:
		stats.acceleration = 10
