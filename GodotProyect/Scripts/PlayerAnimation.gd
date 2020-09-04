extends AnimatedSprite


var currentState
var lastPosTimer = 1
var lastPos
var finalPos

onready var timer = $Timer
var idleTimer = 0

func _ready():
	self.get_parent().get_parent().get_node("Items/Cajonera/Area2D").connect("romper", self, "rompCajon")
	lastPos = self.position
	finalPos = self.position
	currentState = "Idle"

func rompCajon():
	currentState = "RomperCajon"
	
func agarAbajo():
#	currentState = "AgarrAbajo"
	pass
	
func agarArriba():
#	currentState = "AgarrArriba"
	pass

func _process(delta):
	animation = currentState
	if lastPosTimer >= 1:
		if lastPos == self.position:
			finalPos = self.position
		lastPos = self.position
		lastPosTimer = 0
	
	if currentState == "Idle":
		if idleTimer == 0:
			timer.set_wait_time(randi()%17+7)
			timer.start()
		idleTimer = 1
	else:
		timer.stop()
		idleTimer = 0
	
	
	if self.position.x - finalPos.x  > 1:
		currentState = "WalkingLeft"
	if self.position.x - finalPos.x  < 1 and self.position.x - finalPos.x > -1:
		currentState = "Idle"
	if self.position.x - finalPos.x < -1:
		currentState = "WalkingRight"
	
	lastPosTimer += 1

func _input(event):
	if event.is_action_pressed("left_click") or event.is_action_pressed("right_click"):
		idleTimer = 0
	if Inventario.currentlyUsing != "":
		if event.is_action_released("left_click"):
			finalPos = get_global_mouse_position()
	else:
		if event.is_action_pressed("left_click") and Inventario.onViewport:
			finalPos = get_global_mouse_position()


func _on_timeout():
	Dialogo.rand_phrase()
