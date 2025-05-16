extends Control
class_name PartMenu

@export var player : Player
@export var vbox : Node 
@onready var grid: GridContainer = $GridContainer

var currency : int 
var equippedparts:Array = []


'''
this is the partfiles area. eventually, we'll be able to datapack into this array, but not yet.
for now, each "part file" is just an array of 3 values: a tscn, the part's name, and
the cost of the part.
'''

var partarray = [
	["Dash Up", load("res://parts/dashpart/dashpart.tscn"), 100],
	["Exhaust part", load("res://parts/exhaustpart/exhaustpart.tscn"), 300]
]

'''
the part button is a type of button that adds both a timer to the players UI,
and a part to the parthandler. the partbutton has it's data passed to it from the array,
but eventually we'll probably have a dedicated partfile's resource that can be datapacked into
the array.
'''

func open():
	for part in partarray:
		var p = PartButton.new()
		p.part = part
		p.handler = self
		p.partcost = part[2]
		grid.add_child(p)


func _ready() -> void:
	open()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("part menu") and not visible:
		show()
	elif event.is_action_pressed("part menu"): 
		hide()


func _on_quit_pressed() -> void:
	hide()
