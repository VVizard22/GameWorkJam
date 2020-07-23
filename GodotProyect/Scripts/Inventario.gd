extends Node

signal nuevoInventario
signal combineItems

var inventario = {}

var resultados = {"Pilas AAAAluminio": "PilasAA", "PilasAALinterna": "Linterna Cargada"}



func added_item(nombre, textura):
	var add_comb = true
	inventario[nombre] = textura
	
	#print_debug(inventario)
	emit_signal("nuevoInventario")

func ValidComb(item1, item2):
	var validComb = false
	for s in resultados.keys():
		if item1+item2 == s or item2+item1 == s:
			validComb = true
	return validComb


func Combine(item1, item2):
	for s in resultados:
		if item1+item2 == s or item2+item1 == s:
			inventario.erase(item1)
			inventario.erase(item2)
			emit_signal("combineItems")
			
			added_item(resultados[s], ResourceLoader.load("res://Sprites/"+ resultados[s]+ ".png"))
			
