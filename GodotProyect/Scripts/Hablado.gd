extends Label

func _ready():
	Dialogo.connect("topico", self, "decir")
	
func decir(topic):
	self.text = "-" + Dialogo.descripcion[topic]
	get_parent().get_node("Efecto").play("Typewriter_text_effect")
