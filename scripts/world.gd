extends Node2D


@onready var wavetimer: Timer = $wavetimer
@onready var spawnspread: Timer = $spawnspread

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

@onready var spawners: Node2D = $spawners


@onready var spawnerarray = spawners.get_children() 

var camzoomed : bool

var spawnertouse : int

func _ready() -> void:
	wavetimer.start(10)

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		label.text = str(score)
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
	spawnspread.start()
	var bigorsmall = randf_range(1, 10)
	if bigorsmall >= 8.5:
		for i in 10:
			spawnertouse = randi_range(0, 2)
			await spawnspread.timeout
			spawnspread.start(7)
			spawnerarray[spawnertouse].Spawn_def()
		wavetimer.start(30)
	else:
		for i in randi_range(2, 5):
			spawnertouse = randi_range(0, 2)
			await spawnspread.timeout
			spawnspread.start(1.5)
			spawnerarray[spawnertouse].Spawn_def()
		wavetimer.start(randi_range(9,17))


func _on_point_timer_timeout() -> void:
	score+=10
	pointtick.emit(score)
	label.text = "you survived "+str(score)+" waves!"
