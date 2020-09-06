extends Control

var cFrame = 0

func _ready():
	AudioController.Play("Intro")
	var final = get_node("Final")
	final.play("Paginas")
	cFrame = final.get_frame()
	print_debug(cFrame)

func _on_Atras_pressed():
	var final = get_node("Final")
	if cFrame != 0:
		final.play("T" + str(cFrame), true)
		AudioController.Play("Paginas")
		yield(get_tree().create_timer(1), "timeout")
		final.play("Paginas")
		final.set_frame(cFrame - 1)
	cFrame = final.get_frame()

func _on_Adelante_pressed():
	var final = get_node("Final")
	if cFrame != 2:
		final.play("T" + str(cFrame + 1))
		AudioController.Play("Paginas")
		yield(get_tree().create_timer(1), "timeout")
		final.play("Paginas")
		final.set_frame(cFrame + 1)
	elif cFrame == 2:
		get_node("Adelante").visible = false
		get_node("Atras").visible = false
		final.play("Ending")
		yield(get_tree().create_timer(3), "timeout")
		Loader._changeScene("Menu", "Wipe")
	cFrame = final.get_frame()

func _on_TextureButton_pressed():
	Loader._changeScene("Menu", "Wipe")
