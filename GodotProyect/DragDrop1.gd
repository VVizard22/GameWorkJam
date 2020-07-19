extends TextureRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_drag_data(_pos):
	# Use another colorpicker as drag preview
	var letter = TextureRect.new()
	letter.expand=true
	letter.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	letter.texture=texture
	letter.rect_size = Vector2(120, 120)
	set_drag_preview(letter)
	# Return color as drag data
	return texture
