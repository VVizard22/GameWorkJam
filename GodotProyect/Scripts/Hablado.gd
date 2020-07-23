extends Label


func _ready():
	Dialogo.connect("topico", self, "decir")
	
func decir(topic):
	self.text = Dialogo.descripcion[topic]
