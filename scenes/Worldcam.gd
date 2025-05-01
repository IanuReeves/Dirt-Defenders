extends Camera2D

@onready var Playercam = get_parent().get_parent().get_node("Player/Camera2D")
@onready var planet = get_parent()
@onready var player : Player = get_parent().get_parent().get_node("Player")
@onready var world: Node2D = planet.get_parent()

var PPdist : float
var zoomneeded : float
var playerfocus : bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.indsprite.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	PPdist = player.position.distance_to(planet.position)
#	zoomneeded = 300/PPdist 
#	zoom = Vector2(zoomneeded, zoomneeded)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom"):
		if playerfocus:
			make_current()
			playerfocus = false
			player.indsprite.show()
			world.camzoomed = true
		else:
			Playercam.make_current()
			playerfocus = true
			player.indsprite.hide()
			world.camzoomed = false
