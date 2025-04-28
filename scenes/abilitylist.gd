extends Control

@onready var parts : PartHandler = get_parent().get_parent().get_node("PartHandler")
@onready var player : Player = get_parent().get_parent()
func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if Input.is_action_just_released("part") and player.isloaded:
		show()
	else:
		pass

func _on_spam_boom_sound_pressed() -> void:
	var boompart = preload("res://parts/boompart/boompart.tscn").instantiate()
	parts.add_child(boompart)
	hide()



func _on_dashbooster_pressed() -> void:
	var dashpart = preload("res://parts/dashpart/dashpart.tscn").instantiate()
	parts.add_child(dashpart)
	hide()


func _on_attackbooster_pressed() -> void:
	var attackpart = preload("res://parts/exhaustpart/exhaustpart.tscn").instantiate()
	parts.add_child(attackpart)
	hide()
