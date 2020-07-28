extends Node



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Dialogo.primeraVezSala:
		text()
		Dialogo.primeraVezSala = false

func text():
	yield(get_tree().create_timer(2), "timeout")
	Dialogo.direc_Text("Ooof, no se como me caí, pero menos mal que me levanté y mis clases de scout me ayudaron a saber desatar el nudo")
	yield(get_tree().create_timer(5), "timeout")
	Dialogo.direc_Text("Ahora me tengo que concentrar en salir de esta habitacion para resolver el caso, estaba tan cerca")
