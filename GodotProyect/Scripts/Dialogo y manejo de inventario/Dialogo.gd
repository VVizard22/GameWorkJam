extends Node

func _ready():
	pass # Replace with function body.

signal topico
var descripcion = {	"Linterna": "Una linterna con luz ultravioleta, pero necesita unas pilas AA para funcionar",
					"Pilas AAA": "Unas simples pilas AAA",
					"Aluminio": "Me pregunto que podre hacer con papel metalico",
					"Pilas AA": "Como las AAA, solo que un poco mas grandes",
					
					"Libro": "Teoría del colór, tomo 8, un libro muy interesante... mentira, nunca lo leí",
					"Biblioteca": "Una biblioteca con libros de teoría del arte y grandes artistas",
					"Compartimiento": "La biblioteca tenía un compartimiento secreto, que será tan privado que este señor tenga que protejer?",
					
					"Cuadro": "'La Mona Lisa', muy buen cuadro debo admitir, aunque de un poco de miedo ya que parece que siempre me esta mirando",
					
					"Puerta": "",
					"Panel Codigo": "",
					
					"Escultura": "El artista que la está trabajando es realmente talentoso, una pena que deba arrestarlo por intentar raptarme",
					"Cincel": "Unas herramientas típicas de trabajo para un escultor, pero tambien son útiles para tecnicas de detective",
					
					
					"Cuerda": "",
					
					"Cajonera": "No hay nada muy interesante en los cajones... pero el ultimo parece necesitar una llave",
					"AbrirCajon": "Ese último cajón enía una linterna, pero requiere unas pilas AA para funcionar",
					
					"NoCombina": "No creo que esos dos vayan juntos",
					
					"Panel": "Es un panel electronico que requiere un código... tal vez abra la puerta"}

func get_topic(topic):
	for t in descripcion:
		if topic == t:
			emit_signal("topico", topic)
