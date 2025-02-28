extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.	
func _on_start_button_pressed() -> void:
	print("Game Started. Loading World...")
	get_tree().change_scene_to_file("res://scenes/ui/main.tscn")



func _on_options_button_pressed() -> void:
	print("Opening options menu...")
	get_tree().change_scene_to_file("res://scenes/ui/options_menu.tscn")



func _on_quit_button_pressed() -> void:
	print("Game Quit. Exiting Game...")
	get_tree().quit()
