extends Control
class_name HotkeyRebindButton
# Variable for the label and button of the keybind stuffs
@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button


@export var actionname: String = "forward"

# Ignores non-recognized inputs; Calls label and button naming
func _ready():
	set_process_unhandled_input(false)
	set_action_name()
	set_key_text()
	
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


func set_key_text() -> void:
	var action_events = InputMap.action_get_events(actionname)
	var action_event = action_events[0]
	
	button.text = "%s" % action_event
	

func _on_button_toggled(toggled_on: bool) -> void:
	if button.button_pressed:
		button.text = "press any key..."
	else:
		set_key_text()
