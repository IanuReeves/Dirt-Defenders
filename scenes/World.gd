extends Node2D

# camera stuff

var MinimapOn = true
var zoomneeded = 0
var PPdist


@onready var planet: Area2D = $"Gravity Well"
@onready var player: Player = $Player
@onready var worldcam: Camera2D = $"Gravity Well/Worldcam"
@onready var playercam: Camera2D = $Player/Camera



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	PPdist = float(Vector2(player.position.x, player.position.y).distance_to(Vector2(planet.position.x, planet.position.y)))
	zoomneeded = ( 800 / PPdist)
	if Input.is_action_pressed("zoom"):
		if MinimapOn: 
			MinimapOn = false
			playercam.make_current()
		elif not MinimapOn:
			MinimapOn = true 
			worldcam.make_current()
	if MinimapOn == true:
		worldcam.zoom.x = zoomneeded
		worldcam.zoom.y = zoomneeded
	else:
		zoomneeded = 0.5
