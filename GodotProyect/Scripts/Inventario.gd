extends Node

signal nuevoInventario
var inventario = {}

var combinaciones = {}

func _ready():
	pass

func added_item(nombre, textura):
	inventario[nombre] = textura
	print_debug(inventario)
	emit_signal("nuevoInventario")
