extends TextureRect

var hover

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
	return Inventario.ValidComb(name, data)

func drop_data(_pos, data):
	Inventario.Combine(name, data)

