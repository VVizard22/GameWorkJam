extends Area2D


export(String) var neededItem
var hover = false
var active = false

func _process(delta):
	if active:
		var areas = self.get_overlapping_areas()
		for s in areas:
			if s.get_parent().is_in_group("Player"):
				Inventario.Remove(neededItem)
				self.get_parent().animation = "Compartimiento"
				yield(get_tree().create_timer(1), "timeout")
				Inventario.added_item("Pilas AAA", ResourceLoader.load("res://Sprites/Objetos/Pilas AAA.png"))
				Inventario.added_item("Anotaciones", ResourceLoader.load("res://Sprites/Objetos/Anotaciones.png"))
				Dialogo.get_topic("Compartimiento")
				active = false
	

func _on_mouse_entered():
	hover = true
	
func _on_mouse_exited():
	hover = false

func _input(event):
	if event.is_action_pressed("right_click") and hover:
		Dialogo.get_topic("Biblioteca")
	if Input.is_action_just_released("left_click") and hover and Inventario.currentlyUsing != "":
		if neededItem == Inventario.currentlyUsing:
			_activate_Item()
		else:
			Dialogo.get_topic("NoCombina")

func _activate_Item():
	active = true
