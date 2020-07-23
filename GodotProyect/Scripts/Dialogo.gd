extends Node

func _ready():
	pass # Replace with function body.

signal topico
var descripcion = {"Pilas AAA": "Parecen pilas AAA", "Aluminio": "Me pregunto que podre hacer con papel metalico"}

func get_topic(topic):
	for t in descripcion:
		print_debug(topic + "anda" + t)
		if topic == t:
			emit_signal("topico", topic)
