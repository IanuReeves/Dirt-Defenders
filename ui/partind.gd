extends VBoxContainer


@onready var player : Player = get_parent().get_parent()
@onready var UI = get_parent().get_parent()
@onready var parthandler = player.get_node("PartHandler")

@onready var parttimer1: PartTimer = $PartTimer1
@onready var parttimer2: PartTimer = $PartTimer2
@onready var parttimer3: PartTimer = $PartTimer3
@onready var parttimer4: PartTimer = $PartTimer4

func _process(delta: float) -> void:
	parttimer1.part2check = parthandler.part1
	parttimer2.part2check = parthandler.part2
	parttimer3.part2check = parthandler.part3
	parttimer4.part2check = parthandler.part4
