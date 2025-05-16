extends CanvasLayer
@onready var score_label: Label = $ScoreLabel
@onready var hi_score_label: Label = $HiScoreLabel


@export var scores:scorefile = load("res://deathscreen/score.tres")


var highscore = scores.highscore

var last_score = scores.last_score

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")


func set_score():
	if last_score > highscore:
		score_label.text = "old score: "+ str(highscore)
		highscore = last_score
		scores.highscore = highscore
		hi_score_label.text = "NEW HIGHSCORE: "+str(highscore)
		ResourceSaver.save(scores, "res://deathscreen/score.tres")
	else:
		score_label.text = "last score: "+str(scores.last_score)
		hi_score_label.text = "HIGHSCORE: "+str(scores.highscore)

func _process(delta: float) -> void:
	set_score()
