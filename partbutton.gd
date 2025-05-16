extends Button
class_name PartButton

@export var handler : PartMenu
const PARTTIMER = preload("res://scenes/partmenu/partlist/parttimer.tscn")
@onready var world = handler.get_parent().get_parent().get_parent()


var part : Array
var partcost:int 

func _ready() -> void:
	pressed.connect(add_part)
	text = part[0]

func add_part():
	if handler.currency >= partcost:
		var part_to_add = part[1].instantiate()
		var activepart = part_to_add
		var pt = PARTTIMER.instantiate()
		pt.part = part_to_add
		handler.player.parts.add_child(part_to_add)
		handler.vbox.add_child(pt)
		part_to_add.PT = pt
		handler.hide()
		world.currency -= partcost
		queue_free()
	else:
		handler.hide()
	
