extends Label

var number = "0"
signal num1

func _ready():
	self.text = number
	

func _on_NumberUpOne_pressed():
	if not number == "9":
		number = str(int(number) + 1)
	elif number == "9":
		number = "0"
	self.text = number
	emit_signal("num1", number)


func _on_NumberDownOne_pressed():
	if not number == "0":
		number = str(int(number) - 1)
	elif number == "0":
		number = "9"
	self.text = number
