extends Area2D


export(String) var neededItem
var hover = false
var active = false
var notUsed = true
var abierto = false

func _process(delta):
	if active:
		var areas = self.get_overlapping_areas()
		for s in areas:
			if s.get_parent().is_in_group("Player") and notUsed:
				Inventario.durabCincel -= 1
				if Inventario.durabCincel == 0:
					Inventario.Remove(neededItem)
				self.get_parent().play("Trabado")
				Inventario.added_item("Linterna", ResourceLoader.load("res://Sprites/Objetos/Linterna.png"))
				Dialogo.get_topic("AbrirCajon")
				active = false
				notUsed = false
	elif active and notUsed == false:
		Dialogo.direc_Text("Ya abrí el cajón")


func _on_mouse_entered():
	hover = true
	
func _on_mouse_exited():
	hover = false

func _input(event):
	if Input.is_action_just_pressed("right_click") and hover:
		Dialogo.get_topic("Cajonera")
	if Input.is_action_pressed("left_click") and hover:
		if not abierto:
			self.get_parent().play("Cajones")
		abierto = true
	if Input.is_action_just_released("left_click") and hover and Inventario.currentlyUsing != "":
		if neededItem == Inventario.currentlyUsing:
			_activate_Item()
		elif Inventario.currentlyUsing == "Llave":
			Dialogo.direc_Text("Diablos se rompio la llave, tendre que forzar el cajon o quiza romperlo")
			Inventario.Remove("Llave")
		else:
			Dialogo.get_topic("NoCombina")

func _activate_Item():
	active = true
