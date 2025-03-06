extends VBoxContainer


@onready var player : Player = get_parent().get_parent().get_parent()
@onready var UI = get_parent().get_parent()
@onready var parthandler = player.get_node("PartHandler")

@onready var parttimer1: PartTimer = $PartTimer1
@onready var parttimer2: PartTimer = $PartTimer2
@onready var parttimer3: PartTimer = $PartTimer3
@onready var parttimer4: PartTimer = $PartTimer4

func _ready():
	for child in get_children():
		if child is PartTimer:
			child.node2check = parthandler.get_node("dashpart")
