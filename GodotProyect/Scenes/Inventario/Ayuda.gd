extends Control


func _ready():
	pass # Replace with function body.

func _on_TextureButton_pressed():
	self.visible = not self.visible

func _on_Ayuda_pressed():
	self.visible = not self.visible

func _on_Salir_pressed():
	Loader._changeScene("Menu", "Wipe")
