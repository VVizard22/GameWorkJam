extends TextureRect

func get_drag_data(_pos):
	# Use another colorpicker as drag preview
	var letter = TextureRect.new()
	letter.expand=true
	letter.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	letter.texture=texture
	letter.rect_size = Vector2(50, 50)
	set_drag_preview(letter)
	
	# Return color as drag data	
	return texture

func can_drop_data(_pos, data):
	return typeof(data) == TYPE_OBJECT

func drop_data(_pos, data):
	texture=data
