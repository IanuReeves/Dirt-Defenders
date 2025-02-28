extends Part


var slowbonus : float
var turbobonus : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.vel < 10: 
		slowbonus = 20
	else:
		slowbonus = 0
	turbobonus = player.turbo
	attack = slowbonus + turbobonus 
