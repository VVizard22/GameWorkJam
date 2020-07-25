extends Area2D


export(String) var neededItem
var hover = false

func _on_mouse_entered():
	hover = true
	
func _on_mouse_exited():
	hover = false

func _input(event):
	if Input.is_action_just_released("left_click") and hover and Inventario.currentlyUsing != "":
		if neededItem == Inventario.currentlyUsing:
			_activate_Item()
		else:
			Dialogo.get_topic("NoCombina")

func _activate_Item():
	pass
