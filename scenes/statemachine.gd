extends ASM

#WARNING: FOR NOW, KEEP THE STATE MACHINE

@onready var PAPI : Player = get_parent()
@onready var UI = get_parent().get_node("UIL/UI")
@onready var weapon1 : Node2D = $Weapon1
@onready var weapon2 : Node2D = $Weapon2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	partcheck()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
