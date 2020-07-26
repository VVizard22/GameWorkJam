extends AnimatedSprite


var currentState
var lastPosTimer = 1
var lastPos
var finalPos

func _ready():
	lastPos = self.position
	finalPos = self.position
	currentState = "Idle"

func _process(delta):
	animation = currentState
	if lastPosTimer >= 1:
		if lastPos == self.position:
			finalPos = self.position
		lastPos = self.position
		lastPosTimer = 0
	
	
	if self.position.x - finalPos.x  > 10:
		currentState = "WalkingLeft"
	if self.position.x - finalPos.x  < 10 and self.position.x - finalPos.x > -10:
		currentState = "Idle"
	if self.position.x - finalPos.x < -10:
		currentState = "WalkingRight"
	
	lastPosTimer += 1

func _input(event):
	if Inventario.currentlyUsing != "":
		if event.is_action_released("left_click"):
			finalPos = get_global_mouse_position()
	else:
		if event.is_action_pressed("left_click") and Inventario.onViewport:
			finalPos = get_global_mouse_position()
