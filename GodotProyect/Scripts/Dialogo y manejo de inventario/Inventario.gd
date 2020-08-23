extends Node

signal nuevoInventario
signal eliminar

var onViewport = false
var charSpeed = 400


var durabCincel = 2
var currentlyUsing = ""

var inventario = {}

var resultados = {"Pilas AAAAluminio": "Pilas AA", "Pilas AALinterna": "Linterna Cargada", "CincelCaballo": "Aluminio"}


func _process(delta):
	if currentlyUsing == "":
		charSpeed = 400
	else:
		charSpeed = 0

func added_item(nombre, textura):
	var add_comb = true
	inventario[nombre] = textura
	
	emit_signal("nuevoInventario")

func ValidComb(item1, item2):
	var validComb = false
	for s in resultados.keys():
		if item1+item2 == s or item2+item1 == s:
			validComb = true
	return validComb


func Combine(item1, item2):
	if item1 == "Cincel" or item2 == "Cincel":
		durabCincel -= 1
	for s in resultados:
		if item1+item2 == s or item2+item1 == s:
			if item1 == "Cincel" and durabCincel == 0:
				Remove(item1)
				Remove(item2)
			elif item1 == "Cincel" and durabCincel != 0:
				Remove(item2)
			elif item2 == "Cincel" and durabCincel == 0:
				Remove(item1)
				Remove(item2)
			elif item2 == "Cincel" and durabCincel != 0:
				Remove(item1)
			else:
				Remove(item1)
				Remove(item2)
			
			added_item(resultados[s], ResourceLoader.load("res://Sprites/Objetos/"+ resultados[s]+ ".png"))
			
func Remove(item):
	emit_signal("eliminar", item)
	emit_signal("nuevoInventario")


func _input(event):
	if Input.is_action_just_released("left_click") and currentlyUsing != "":
		currentlyUsing = ""

