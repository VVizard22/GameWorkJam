extends Light2D


func _input(event):
	if event.is_action_pressed("pista") and self.enabled == false:
		self.enabled = true
	elif event.is_action_pressed("pista"):
		self.enabled = false
