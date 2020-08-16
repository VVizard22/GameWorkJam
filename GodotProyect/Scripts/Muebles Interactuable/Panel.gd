extends Area2D

var hover = false
var clicked = false


func _process(delta):
	if clicked:
		var areas = self.get_overlapping_areas()
		for s in areas:
			if s.get_parent().is_in_group("Player"):
				self.get_parent().get_parent().get_parent().get_node("Zoom/Panel").visible = true
				clicked = false


func _on_mouse_entered() -> void:
	hover = true


func _on_mouse_exited() -> void:
	hover = false

func _input(event):
	if event.is_action_pressed("left_click") and hover:
		clicked = true
	if event.is_action_pressed("right_click") and hover:
		Dialogo.get_topic("Panel")
