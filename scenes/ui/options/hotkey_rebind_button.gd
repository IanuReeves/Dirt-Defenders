extends Control
class_name HotkeyRebindButton
# Variable for the label and button of the keybind stuffs
@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button


@export var actionname: String = "forward"

# Ignores non-recognized inputs. Calls label naming
func _ready():
	set_process_unhandled_input(false)
	set_action_name()
	
# Makes unassigned keys say "Unassigned", and translation key
func set_action_name() -> void:
	label.text = "Unassigned"
	
	# Translation Key for Keybinds
	match actionname:
		"forward":
			label.text = "Move Forward"
		"brake":
			label.text = "Brake"
		"fire":
			label.text = "Fire"
