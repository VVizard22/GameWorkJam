extends Label

onready var timer = get_parent().get_node("Timer")

func _ready():
	Dialogo.connect("topico", self, "decir")
	
func decir(topic):
	timer.set_wait_time(2)
	timer.start()
	self.text = "-" + Dialogo.descripcion[topic]
	get_parent().get_node("Efecto").play("Typewriter_text_effect")


func _on_Timer_timeout():
	self.text = ""
