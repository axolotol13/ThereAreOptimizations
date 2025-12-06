extends Area2D

var key_taken = false

func _on_body_entered(body: CharacterBody2D) -> void:
	if !key_taken:
		key_taken = true;
		queue_free()
