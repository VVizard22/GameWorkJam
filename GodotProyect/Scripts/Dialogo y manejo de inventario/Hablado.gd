extends Label

onready var timer = get_parent().get_node("Timer")

func _ready():
	Dialogo.connect("topico", self, "decir")
	Dialogo.connect("phrase", self, "frase")
	Dialogo.connect("ayuda", self, "tutorial")
	
func decir(topic):
	Dialogo.writing = true
	timer.set_wait_time(5)
	timer.start()
	self.text = "-" + Dialogo.descripcion[topic]
	get_parent().get_node("Efecto").play("Typewriter_text_effect")

func frase(topic):
	Dialogo.writing = true
	timer.set_wait_time(5)
	timer.start()
	self.text = "-" + Dialogo.random[topic]
	get_parent().get_node("Efecto").play("Typewriter_text_effect")

func _on_Timer_timeout():
	self.text = ""
	Dialogo.writing = true

func tutorial(text):
	Dialogo.writing = true
	timer.set_wait_time(5)
	timer.start()
	self.text = "-" + text
	get_parent().get_node("Efecto").play("Typewriter_text_effect")

func _input(event):
	if Dialogo.writing and event.is_action_pressed("right_click"):
		_on_Timer_timeout()
		timer.stop()
