extends TextureRect

var hover

func _process(delta):
	pass

func get_drag_data(_pos):
	# Use another colorpicker as drag preview
	var preview = TextureRect.new()
	preview.expand=true
	preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	preview.texture=texture
	preview.rect_size = Vector2(50, 50)
	set_drag_preview(preview)
	# Return color as drag data	
	return name

func can_drop_data(_pos, data):
	return true

func drop_data(_pos, data):
	if Inventario.ValidComb(name, data):
		Inventario.Combine(name, data)
	
	elif data == "Pilas AAA" and self.name == "Linterna":
		Dialogo.direc_Text("Estas pilas no le terminan de servir a la linterna, necesita unas mas grandes")
	elif data == "Linterna" and self.name == "Pilas AAA":
		Dialogo.direc_Text("Estas pilas no le terminan de servir a la linterna, necesita unas mas grandes")
	else:
		Dialogo.get_topic("NoCombina")
	
	




func _on_mouse_entered():
	hover = true


func _on_mouse_exited():
	hover = false

func _input(event):
	if hover and event.is_action_pressed("right_click"):
		Dialogo.get_topic(name)
		if name == "Anotaciones":
			self.get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Anotaciones").visible = true
	
	elif hover and event.is_action_pressed("left_click"):
		Inventario.currentlyUsing = name
