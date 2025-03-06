extends Control
class_name PauseMenu

# Variables for buttons and menus for signals
@onready var resume_button: Button = $VBoxContainer/ResumeButton
@onready var options_button: Button = $VBoxContainer/OptionsButton
@onready var quit_to_main_menu_button: Button = $VBoxContainer/QuitToMainMenuButton
@onready var quit_to_desktop_button: Button = $VBoxContainer/QuitToDesktopButton

@onready var options_menu: OptionsMenu = $options_menu
@onready var v_box_container: VBoxContainer = $VBoxContainer

@onready var tab_container: TabContainer = $TabContainer



# ------------------------------------------ #
# Self-expanatory function; grabs focus for arrow key emulation
func _ready() -> void:
	handle_connecting_signals()
	$VBoxContainer/ResumeButton


# Loads the preloaded gameply when start button pressed
func on_resume_button_pressed() -> void:
	print("Game Started. Loading scene...")
	visible = false
	Engine.time_scale = 1
	


# Hides main menu; Shows options menu
func on_options_button_pressed() -> void:
	v_box_container.visible = false
	print("Opening options menu...")
	options_menu.set_process(true)
	options_menu.visible = true

# Quit game to menu
func on_quit_to_main_menu_button_pressed() -> void:
	print("Quiting to the Main Menu")
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	Engine.time_scale = 1
	
	
# Quit game :/
func on_quit_to_desktop_button() -> void:
	print("Game Quit. Exiting Game...")
	get_tree().quit()


# Hides options menu; Shows main menu
func on_exit_options_menu() -> void:
	options_menu.visible = false
	v_box_container.visible = true

# Handle for signals cause I didn't want to do it the normal way. Fight me
func handle_connecting_signals() -> void:
	resume_button.button_down.connect(on_resume_button_pressed)
	options_button.button_down.connect(on_options_button_pressed)
	quit_to_main_menu_button.button_down.connect(on_quit_to_main_menu_button_pressed)
	quit_to_desktop_button.button_down.connect(on_quit_to_desktop_button)
	options_menu.exit_options_menu.connect(on_exit_options_menu)


func _on_quit_to_main_menu_button_pressed() -> void:
	pass # Replace with function body.


func _on_resume_button_pressed() -> void:
	pass # Replace with function body.
