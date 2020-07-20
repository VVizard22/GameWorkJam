extends Area2D

onready var nombre = self.get_parent().name
onready var textura = self.get_parent().texture


var hover = false

func _on_mouse_entered():
	hover = true

func _on_mouse_exited():
	hover = false

func _input(event):
	if hover and event.is_action_pressed("left_click"):
		Inventario.added_item(nombre, textura)
		self.get_parent().queue_free()
