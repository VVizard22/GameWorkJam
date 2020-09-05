extends Control
var cFrame = 0

func _ready():
	var intro = get_node("Intro")
	intro.play("Paginas")
	cFrame = intro.get_frame()
	print_debug(cFrame)

func _on_TextureButton_pressed():
	Loader._changeScene("Tutorial", "Wipe")


func _on_Atras_pressed():
	var intro = get_node("Intro")
	if cFrame != 0:
		intro.play("T" + str(cFrame), true)
		yield(get_tree().create_timer(1.2), "timeout")
		intro.play("Paginas")
		intro.set_frame(cFrame - 1)
	cFrame = intro.get_frame()
	


func _on_Adelante_pressed():
	var intro = get_node("Intro")
	if cFrame != 8:
		intro.play("T" + str(cFrame + 1))
		yield(get_tree().create_timer(1.2), "timeout")
		intro.play("Paginas")
		intro.set_frame(cFrame + 1)
	elif cFrame == 8:
		intro.play("T9")
		yield(get_tree().create_timer(1), "timeout")
		Loader._changeScene("Tutorial", "Wipe")
	cFrame = intro.get_frame()
