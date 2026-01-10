extends Control

func _ready():
	$VBoxContainer/TimerToggle.toggled.connect(_on_TimerToggle_toggled)
	$VBoxContainer/InputMirrorToggle.toggled.connect(_on_InputMirrorToggle_toggled)
	$VBoxContainer/PlayButton.pressed.connect(_on_PlayButton_pressed)
func _on_TimerToggle_toggled(pressed):
	Global.show_timer = pressed

func _on_InputMirrorToggle_toggled(pressed):
	Global.show_input_mirror = pressed

func _on_PlayButton_pressed():
	get_tree().change_scene_to_file("res://World.tscn")
