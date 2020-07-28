extends Area2D


var hover = false



func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false

func _input(event):
	if hover and event.is_action_pressed("left_click"):
		get_parent().get_node("Animation").play("Fall")
		get_parent().get_node("Hint").enabled = false
		yield(get_tree().create_timer(1.4), "timeout")
		Loader._changeScene("ArtRoom", "none")
