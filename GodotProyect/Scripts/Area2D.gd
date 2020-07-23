extends Area2D

onready var nombre = self.get_parent().name
onready var textura = self.get_parent().texture

export(String) var description

var clicked = false
var hover = false

func _on_mouse_entered():
	hover = true

func _on_mouse_exited():
	hover = false

func _process(delta):
	if clicked:
		var areas = self.get_overlapping_areas()
		for s in areas:
			if s.get_parent().is_in_group("Player"):
				Inventario.added_item(nombre, textura)
				self.get_parent().queue_free()

func _input(event):
	if hover and event.is_action_pressed("left_click"):
		clicked = true
	if hover and event.is_action_pressed("right_click"):
		Dialogo.get_topic(get_parent().name)
