extends TextureButton

func _ready():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	Loader._changeScene("ArtRoom", "Wipe")
