extends CanvasLayer
class_name UI
@onready var score_label = %Label
@onready var player = get_parent().get_node("World/Player")

@onready var health: Label = $Control/Stats/VBoxContainer/Health
@onready var def: Label = $Control/Stats/VBoxContainer/DEF
@onready var atk: Label = $Control/Stats/VBoxContainer/ATK
@onready var turbo: Label = $Control/Stats/VBoxContainer/TURBO
@onready var spedometer: Label = $Control/Stats/VBoxContainer/SPEDOMETER

var score = 0
var maxScore = 10000 

func update_score(value):
	score += value
	update_score_label()
	
func update_score_label():
	score_label.text = "Score " + str(score)

func UIupdate():
	def.text = str(player.defense) 
	atk.text = str(player.attack)
	turbo.text = str(player.turbo)
	health.text = str(player.health)
	spedometer.text = str(round(player.velocity.length()))

func _process(delta: float) -> void:
	UIupdate()
