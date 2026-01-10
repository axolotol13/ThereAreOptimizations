extends Area2D

var win_taken = false

func _on_body_entered(body: CharacterBody2D) -> void:
	if !win_taken:
		win_taken = true
		Global.isCounting = false
		queue_free()
