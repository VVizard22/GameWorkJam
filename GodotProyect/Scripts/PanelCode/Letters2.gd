extends Label

var letter = "A"
signal let2

func _ready():
	self.text = letter

func _on_LetterUpTwo_pressed():
	if not letter == "Z":
		letter = char(ord(letter) + 1)
	elif letter == "Z":
		letter = "A"
	self.text = letter
	emit_signal("let2", letter)


func _on_LetterDownTwo_pressed():
	if not letter == "A":
		letter = char(ord(letter) - 1)
	elif letter == "A":
		letter = "Z"
	self.text = letter
	emit_signal("let2", letter)
