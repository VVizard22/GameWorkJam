extends Label

var number = "0"

func _ready():
	self.text = number
	

func _on_NumberUpTwo_pressed():
	if not number == "9":
		number = str(int(number) + 1)
	elif number == "9":
		number = "0"
	self.text = number


func _on_NumberDownTwo_pressed():
	if not number == "0":
		number = str(int(number) - 1)
	elif number == "0":
		number = "9"
	self.text = number
