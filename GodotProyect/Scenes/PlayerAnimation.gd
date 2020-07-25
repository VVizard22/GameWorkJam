extends AnimatedSprite


var currentState
var lastPosTimer = 3
var lastPos
var finalPos

func _ready():
	lastPos = self.position
	finalPos = self.position
	currentState = "Idle"

func _process(delta):
	animation = currentState
	if self.position.x - finalPos.x  > 10:
		currentState = "WalkingLeft"
	if self.position.x - finalPos.x  < 10 and self.position.x - finalPos.x > -10:
		currentState = "Idle"
	if self.position.x - finalPos.x < -10:
		currentState = "WalkingRight"
		
	if lastPosTimer >= 3:
		if lastPos == self.position:
			finalPos = self.position
		lastPos = self.position
		lastPosTimer = 0
	lastPosTimer += 1

func _input(event):
	if event.is_action_pressed("left_click"):
		finalPos = get_global_mouse_position()
