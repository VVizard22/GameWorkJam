extends Node

func _ready():
	pass # Replace with function body.

signal topico
var descripcion = {"Linterna": "",
					"Pilas AAA": "Parecen pilas AAA",
					"Aluminio": "Me pregunto que podre hacer con papel metalico",
					"Pilas AA": "",
					"Libro": "Mmmmmmmmmmmh, el libro del famoso Capitán Colmillo",
					"Escultura": "",
					"Cuadro": "",
					"Puerta": "",
					"Panel Codigo": "",
					"Biblioteca": "",
					"Compartimiento": "",
					"Cuerda": "",
					"NoCombina": "No creo que esos dos vayan juntos"}

func get_topic(topic):
	for t in descripcion:
		if topic == t:
			emit_signal("topico", topic)
