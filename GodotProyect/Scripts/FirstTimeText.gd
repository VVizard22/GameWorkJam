extends Node

onready var items = get_parent().get_node("Items").get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Dialogo.primeraVezSala:
		for s in items:
			s.get_node("Area2D").visible = false
		text()
		Dialogo.primeraVezSala = false

func text():
	yield(get_tree().create_timer(2), "timeout")
	Dialogo.direc_Text("Ooof, no se como me salvé de esa, es como si una fuerza extraña me hubiese ayudado.")
	yield(get_tree().create_timer(5), "timeout")
	Dialogo.direc_Text("Ahora me tengo que concentrar en salir de esta habitacion para resolver el caso, estaba tan cerca.")
	for s in items:
			s.get_node("Area2D").visible = true
