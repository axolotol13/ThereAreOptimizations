extends Control

func _ready():
	$VBoxContainer/TimerToggle.text = "Speedrun Timer"
	$VBoxContainer/InputMirrorToggle.text = "Input Mirror"

func _on_TimerToggle_toggled(pressed):
	Global.show_timer = pressed

func _on_InputMirrorToggle_toggled(pressed):
	Global.show_input_mirror = pressed

func _on_PlayButton_pressed():
	get_tree().change_scene_to_file("res://World.tscn")
