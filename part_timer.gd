extends Control
class_name PartTimer 

var spriteshown 
var cooldown
@onready var spritedisplay: Sprite2D = $Sprite2D
@onready var player = get_parent().get_parent().get_parent().get_parent()
@onready var statemachine = player.get_node("PartHandler")
@onready var part2check : Part = get_parent().get_parent().part2check
@onready var stats: PlayerStats 
@onready var timelabel: Label = $timelabel
@
func get_stats() -> void:
	stats = part2check.stats
	spriteshown = part2check.icon
	cooldown = part2check.cooldown
func _ready() -> void:
	get_stats()
	if part2check.cooldown > 0:
		timelabel.text = str(part2check.cooltime)
	else:
		timelabel.text = str(" ")
