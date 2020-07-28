extends Node

var firstTime = true
var ruedita = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if firstTime:
		firstTime = false
		text()
		

func text():
		yield(get_tree().create_timer(2), "timeout")
		Dialogo.direc_Text("Mmmmh, parece que está dormido-")
		yield(get_tree().create_timer(5), "timeout")
		Dialogo.direc_Text("Bueno, voy a tener que ayudarte a ayudarlo, dale, haceme este favor-")
		yield(get_tree().create_timer(5), "timeout")
		Dialogo.direc_Text("Apreta la ruedita para ver con que podes interactuar!-")
		ruedita = true

func _input(event: InputEvent) -> void:
	if ruedita and event.is_action_pressed("pista"): 
		ruedita = false
		Dialogo.direc_Text("Y ahora usas click izquierdo para interactuar con eso, asi de facil-")
		yield(get_tree().create_timer(5), "timeout")
		Dialogo.direc_Text("También podes usar click derecho para inspeccionar las cosas, no te olvides-")
		yield(get_tree().create_timer(5), "timeout")
		Dialogo.direc_Text("Suerte ayudandolo!-")
		get_parent().get_node("Player").get_node("Area2D").visible = true
