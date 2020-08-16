extends Control


func play_pressed():
	Loader._changeScene("Tutorial", "Wipe")


func options_pressed():
	pass
	#get_tree().change_scene_to(options_scn)


func _on_Salir_pressed():
	get_tree().quit()
