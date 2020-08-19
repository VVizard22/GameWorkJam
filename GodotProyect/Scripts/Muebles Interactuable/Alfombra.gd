extends Area2D

var hover = false
var clicked = false

func _process(delta):
	pass

func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false

func _input(event):
	if event.is_action_pressed("left_click") and hover:
		clicked = true
		get_parent().texture = load("res://Sprites/Objetos/Alfombra-doblada.png")
	if event.is_action_pressed("right_click") and hover:
		Dialogo.get_topic("Alfombra")

