extends Control

@onready var turbometer: Label = $turbo
@onready var spedometer: Label = $spedometer
@onready var defenselabel: Label = $defense
@onready var hplabel: Label = $HP
@onready var speedlabel: Label = $speed
@onready var attacklabel: Label = $Attack


var vel : float 
var defense : float 
var HP : float 
var attack : float 
var speed : float 
var turbo : float



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	turbometer.text = str(turbo)
	spedometer.text = str(vel)
	defenselabel.text = str(defense)
	hplabel.text = str(HP)
	attacklabel.text = str(attack)
	speedlabel.text = str(speed)
