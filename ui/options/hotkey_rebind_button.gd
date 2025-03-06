extends Control
class_name HotkeyRebindButton
# Variable for the label and button of the keybind stuffs
@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button


@export var actionname: String = "forward"

# Ignores non-recognized inputs; Calls label and button naming
func _ready():
	set_process_unhandled_key_input(false)
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
	

func _on_button_toggled(button_pressed) -> void:
	if button.button_pressed:
		button.text = "press any key..."
		set_process_unhandled_key_input(button_pressed)
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.actionname != self.actionname:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
				
	else:
		
		for i in get_tree().get_nodes_in_group("hotkey_button"):
			if i.actionname != self.actionname:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
				
		set_key_text()
		
func _unhandled_key_input(event):
	rebind_action_key(event)
	button.button_pressed = false
	
func rebind_action_key(event):
	InputMap.action_erase_events(actionname)
	InputMap.action_add_event(actionname, event)
	set_process_unhandled_key_input(false)
	set_key_text()
	set_action_name()
