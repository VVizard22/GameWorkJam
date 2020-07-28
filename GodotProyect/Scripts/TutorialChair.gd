extends Area2D


var hover = false
export var standing = true


func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false

func _input(event):
	if hover and event.is_action_pressed("left_click") and standing:
		get_parent().get_node("AnimationPlayer").play("Fall")
		get_parent().get_node("Hint").enabled = false
		standing = false
	if hover and Inventario.currentlyUsing == "Cuchillo" and event.is_action_released("left_click") and standing == false:
		Inventario.Remove("Cuchillo")
		Loader._changeScene("ArtRoom", "Fade")
