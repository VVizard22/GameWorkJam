extends Area2D

var hover = false
var clicked = false
var oneTime = true

func _process(delta):
	if clicked and oneTime:
		var areas = self.get_overlapping_areas()
		for s in areas:
			if s.get_parent().is_in_group("Player"):
				Inventario.added_item("Cincel", ResourceLoader.load("res://Sprites/Objetos/Cincel.png"))
				Dialogo.get_topic("Cincel")
				oneTime = false
				clicked = false

func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false

func _input(event):
	if event.is_action_pressed("left_click") and hover:
		clicked = true
	if event.is_action_pressed("right_click") and hover:
		Dialogo.get_topic("Escultura")

