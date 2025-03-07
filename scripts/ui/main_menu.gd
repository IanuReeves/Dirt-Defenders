extends Control
class_name MainMenu

# Variables for buttons and menus for signals
@onready var start_button: Button = $MarginContainer/VBoxContainer/StartButton
@onready var options_button: Button = $MarginContainer/VBoxContainer/OptionsButton
@onready var quit_button: Button = $MarginContainer/VBoxContainer/QuitButton

@onready var options_menu: OptionsMenu = $options_menu
@onready var v_box_container: VBoxContainer = $MarginContainer/VBoxContainer
# Pre-lods game for optimization (tie shit)
@onready var start_level: PackedScene = preload("res://scenes/main.tscn")

@onready var tab_container: TabContainer = $TabContainer

#handles soundloop
@onready var gamemusic: AudioStreamPlayer2D = $GameMusic

@onready var sound : AudioStreamPlayer2D = $AudioStreamPlayer2D
var playsound : bool
var playmusic : bool
# ------------------------------------------ #
# Self-expanatory function; grabs focus for arrow key emulation
func _ready() -> void:
	handle_connecting_signals()
	$MarginContainer/VBoxContainer/StartButton.grab_focus()
	


# Loads the preloaded gameply when start button pressed
func on_start_button_pressed() -> void:
	print("Game Started. Loading scene...")
	get_tree().change_scene_to_packed(start_level)
	sound.stop()
	

# Hides main menu; Shows options menu
func on_options_button_pressed() -> void:
	v_box_container.visible = false
	print("Opening options menu...")
	options_menu.set_process(true)
	options_menu.visible = true
	

# Quit game :/
func on_quit_button_pressed() -> void:
	print("Game Quit. Exiting Game...")
	get_tree().quit()


# Hides options menu; Shows main menu
func on_exit_options_menu() -> void:
	options_menu.visible = false
	v_box_container.visible = true
	
# Handle for signals cause I didn't want to do it the normal way. Fight me
func handle_connecting_signals() -> void:
	start_button.button_down.connect(on_start_button_pressed)
	options_button.button_down.connect(on_options_button_pressed)
	quit_button.button_down.connect(on_quit_button_pressed)
	options_menu.exit_options_menu.connect(on_exit_options_menu)


func _on_audio_stream_player_2d_finished() -> void:
	if playsound:
		sound.play()
