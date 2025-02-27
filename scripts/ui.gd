extends CanvasLayer
class_name UI
@onready var score_label = %Label

var score = 0
var maxScore = 10000 

func update_score(value):
	score += value
	update_score_label()
	
func update_score_label():
	score_label.text = "Score " + str(score)
