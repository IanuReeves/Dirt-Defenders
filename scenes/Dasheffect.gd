extends Part


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not stats:
		stats = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().get_parent().velocity.length() > 200:
		stats.defense = 30
	else:
		stats.defense = 10
