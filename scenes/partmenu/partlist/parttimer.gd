extends Label
class_name PartTimer

@onready var part : Part
@onready var displaycharge:bool = false
@onready var cooldown:float
@onready var charge : float = 0 

@onready var time_left: Label = $Node/time_left
@onready var chargelabel: Label = $Node/charge

@onready var particon: TextureRect = $Node/icon


@onready var label: Label = $Node/Label



func _ready() -> void:
	if "charge" in part:
		displaycharge = true
	if part.icon:
		particon.texture = part.icon
	if part.name:
		label.text = part.name

func _process(delta: float) -> void:
	cooldown = part.cooltime
	if part.hascooldown:
		time_left.text = str(int(cooldown))
	else:
		time_left.hide()
	if displaycharge:
		charge = part.charge
		if charge >= 0:
			chargelabel.text = str(int(charge))
	else:
		chargelabel.hide()
