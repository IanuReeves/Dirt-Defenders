extends CanvasLayer
class_name UI
@onready var score_label = %Label
@onready var hp: Label = $Control/VBoxContainer/HP
@onready var turbo: Label = $Control/VBoxContainer/TURBO
@onready var spedometer: Label = $Control/VBoxContainer/SPEDOMETER
@onready var attack: Label = $Control/VBoxContainer/ATTACK
@onready var defense: Label = $Control/VBoxContainer/DEFENSE


@onready var player : Player = get_parent().get_node("Player")
@onready var PARTS = player.current_stats
var score = 0
var maxScore = 10000 

func update_score(value):
	score += value
	update_score_label()

func _physics_process(delta: float) -> void:

	turbo.text = "TURBO: " + str(round(player.turbo))
	spedometer.text = "SPEED: " + str(round(player.velocity.length()))
	attack.text = "ATK: " + str(PARTS.attack)
	defense.text = "DEF" + str(PARTS.defense)
	

func update_score_label():
	score_label.text = "Score " + str(score)
