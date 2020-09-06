extends Control

var actualCode = "****"


func _ready():
	self.get_node("Lett1").connect("let1", self, "getLet1")
	self.get_node("Lett2").connect("let2", self, "getLet2")
	self.get_node("Num1").connect("num1", self, "getNum1")
	self.get_node("Num2").connect("num2", self, "getNum2")

func getLet1(letter):
	actualCode.erase(0,1)
	actualCode = actualCode.insert(0,letter)
	verCode()

func getLet2(letter):
	actualCode.erase(1,1)
	actualCode = actualCode.insert(1,letter)
	verCode()
	
func getNum1(number):
	actualCode.erase(2,1)
	actualCode = actualCode.insert(2,number)
	verCode()
	
func getNum2(number):
	actualCode.erase(3,1)
	actualCode = actualCode.insert(3,number)
	verCode()

func verCode():
	if actualCode == PanelC.codigo:
		get_node("Check").texture = load("res://Sprites/Panel/Tick-panel.png")
		AudioController.Play("PuertaAbierta")
		yield(get_tree().create_timer(1), "timeout")
		Loader._changeScene("Final", "Wipe")
	else:
		get_node("Check").texture = load("res://Sprites/Panel/Cruz-panel.png")
