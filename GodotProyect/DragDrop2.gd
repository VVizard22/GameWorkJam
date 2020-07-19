extends TextureRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal activate
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func can_drop_data(_pos, data):
	return typeof(data) == TYPE_OBJECT

func drop_data(_pos, data):
	texture=data
	emit_signal("activate")
