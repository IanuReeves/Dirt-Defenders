extends Control
class_name PartTimer 

var spriteshown 
var cooldown
@onready var spritedisplay: Sprite2D = $Sprite2D
@onready var player = get_parent().get_parent().get_parent().get_parent()
@onready var stats: PlayerStats 
@onready var timelabel: Label = $timelabel
@onready var part2check

func get_stats() -> void:
	stats = part2check.stats
	spriteshown = part2check.icon
	cooldown = part2check.cooldown
	

func _process(delta: float) -> void:
	if part2check:
		if part2check.cooldown > 0:
			timelabel.text = str(part2check.cooltime)
		else:
			timelabel.text = str(" ")
