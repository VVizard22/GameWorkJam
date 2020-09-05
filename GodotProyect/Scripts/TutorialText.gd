extends Node

onready var animations = $"/root/WipeTransition"

var firstTime = true
var ruedita = false
var cuchillo = false
var sillaParada
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sillaParada = get_parent().get_node("Player/Area2D").standing
	if firstTime:
		firstTime = false
		text()
	elif cuchillo and sillaParada == false:
		cuchillo = false
		cuchillo()

func text():
		yield(get_tree().create_timer(2), "timeout")
		Dialogo.direc_Text("Mmmmh, parece que está dormido-")
		yield(get_tree().create_timer(3), "timeout")
		Dialogo.direc_Text("Bueno, voy a tener que ayudarte a ayudarlo, dale, haceme este favor-")
		yield(get_tree().create_timer(3), "timeout")
		Dialogo.direc_Text("Apreta la ruedita para ver con que podes interactuar!-")
		ruedita = true

func _input(event: InputEvent) -> void:
	if ruedita and event.is_action_pressed("pista"): 
		ruedita = false
		Dialogo.direc_Text("Parece que el cuchillo esta lejos, proba clickear a Zack a ver si se cae-")
		get_parent().get_node("Player").get_node("Area2D").visible = true
		cuchillo = true

func cuchillo():
	
	Dialogo.direc_Text("También podes usar click derecho para inspeccionar las cosas, pero de describirlas se va a encargar el-")
	yield(get_tree().create_timer(4), "timeout")
	Dialogo.direc_Text("El click izquierdo tambien te va a perimitr agarrar objetos y ponerlos en tu inventario... probá con ese cuchillo-")
	yield(get_tree().create_timer(4), "timeout")
	get_parent().get_node("Cuchillo/Area2D").visible = true
	Dialogo.direc_Text("Y una vez en tu inventario podes arrastrarlos y soltarlos en un objeto de la escena para alterarlo-")
	yield(get_tree().create_timer(5), "timeout")
	
