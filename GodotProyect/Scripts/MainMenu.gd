extends Control


func play_pressed():
	Loader._changeScene("Tutorial", "Wipe")

func _on_Salir_pressed():
	get_tree().quit()

func _on_Creditos_pressed():
	pass
