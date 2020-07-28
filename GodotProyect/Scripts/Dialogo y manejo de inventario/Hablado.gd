extends Label

onready var timer = get_parent().get_node("Timer")

func _ready():
	Dialogo.connect("topico", self, "decir")
	Dialogo.connect("phrase", self, "frase")
	Dialogo.connect("ayuda", self, "tutorial")
	
func decir(topic):
	timer.set_wait_time(5)
	timer.start()
	self.text = "-" + Dialogo.descripcion[topic]
	get_parent().get_node("Efecto").play("Typewriter_text_effect")

func frase(topic):
	timer.set_wait_time(5)
	timer.start()
	self.text = "-" + Dialogo.random[topic]
	get_parent().get_node("Efecto").play("Typewriter_text_effect")

func _on_Timer_timeout():
	self.text = ""

func tutorial(text):
	timer.set_wait_time(5)
	timer.start()
	self.text = "-" + text
	get_parent().get_node("Efecto").play("Typewriter_text_effect")


