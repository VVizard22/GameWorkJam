extends Control

var actualCode

func _ready():
	var let1 = self.get_node("Lett1").text
	var let2 = self.get_node("Lett2").text
	var num1 = self.get_node("Num1").text
	var num2 = self.get_node("Num2").text
	
	actualCode = let1 + let2 + num1 + num2
	
	verCode()

	
func verCode():
	if actualCode == PanelC.codigo:
		print_debug("Saliste Wachin")
