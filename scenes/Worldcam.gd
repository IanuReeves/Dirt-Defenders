extends Camera2D

@onready var Playercam = get_parent().get_parent().get_node("Player/Camera2D")
@onready var planet = get_parent()
@onready var player : Player = get_parent().get_parent().get_node("Player")

var PPdist : float
var zoomneeded : float
var playerfocus : bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		PPdist = player.position.distance_to(planet.position)
		zoomneeded = 300/PPdist 
		zoom = Vector2(zoomneeded, zoomneeded)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom"):
		if playerfocus:
			self.make_current()
			playerfocus = false
		else:
			Playercam.make_current()
			playerfocus = true
