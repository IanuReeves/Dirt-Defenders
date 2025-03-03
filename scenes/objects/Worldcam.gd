extends Camera2D

@onready var playercam : Camera2D = get_parent().get_parent().get_node("Player/Camera2D")
@onready var player : Player = get_parent().get_parent().get_node("Player")
@onready var planet : GravityWell = get_parent()


#zoomneeded calculates how much zoom is needed
#PPdist is the player to planet distance
#zoomed out declares whether or not the camera is zoomed out


var zoomtinker : int = 80
var zoomedout = true
var zoomneeded : float 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	zoomneeded = 300/(Vector2(player.position.x, player.position.y).distance_to(Vector2(planet.position.x, planet.position.y)))
	if zoomedout:
		zoom.x = zoomneeded
		zoom.y = zoomneeded
	else:
		zoom.x = 4
		zoom.y = 4

func _input(event: InputEvent) -> void:
	if event.is_action_released("zoom"):
		if zoomedout: 
			zoomedout = false
			playercam.make_current()
		else: 
			zoomedout = true 
			make_current()
