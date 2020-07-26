extends Area2D


export(String) var neededItem
var hover = false
var active = false

func _process(delta):
	if active:
		var areas = self.get_overlapping_areas()
		for s in areas:
			if s.get_parent().is_in_group("Player"):
				Inventario.durabCincel -= 1
				if Inventario.durabCincel == 0:
					Inventario.Remove(neededItem)
				Inventario.added_item("Linterna", ResourceLoader.load("res://Sprites/Objetos/Linterna.png"))
				Dialogo.get_topic("AbrirCajon")
				active = false

func _on_mouse_entered():
	hover = true
	
func _on_mouse_exited():
	hover = false

func _input(event):
	if Input.is_action_just_pressed("right_click") and hover:
		Dialogo.get_topic("Cajonera")
	if Input.is_action_just_released("left_click") and hover and Inventario.currentlyUsing != "":
		if neededItem == Inventario.currentlyUsing:
			_activate_Item()
		else:
			Dialogo.get_topic("NoCombina")

func _activate_Item():
	active = true
