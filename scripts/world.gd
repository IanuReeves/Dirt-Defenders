extends Node2D


@onready var wavetimer: Timer = $wavetimer

@onready var label: Label = $deathscreen/Label
@onready var deathscreen: CanvasLayer = $deathscreen
@onready var camera: Camera2D = $deathscreen/Camera2D
@onready var pause_menu: Control = $Player/UI/pause_menu
var paused = false

var score: int = 0 
signal pointtick(points)

#adds a spawner array and gives paths to spawners
#when the timer runs out it randomly selects an element from that array
#then it spawns an enemy from that array

@onready var spawner: EnemySpawner = $spawner
@onready var spawner2: EnemySpawner = $spawner2
@onready var spawner3: EnemySpawner = $spawner3

@onready var spawnerarray = [spawner, spawner2, spawner3]

var camzoomed : bool

var spawnertouse : int

func _ready() -> void:
	wavetimer.start(10)

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused

func death():
	deathscreen.show()






func restart() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")


func _on_wavetimer_timeout() -> void:
	spawnertouse = randi_range(0, 2)
	spawnerarray[spawnertouse].Spawn_def()
	wavetimer.start(randi_range(10,20))


func _on_point_timer_timeout() -> void:
	score+=10
	pointtick.emit(score)
	label.text = "you survived "+str(score)+" waves!"
