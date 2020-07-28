extends Node

signal topico
signal phrase
signal ayuda

var primeraVezSala = true

var random = ["1","2","3","4"]
var descripcion = {	"Linterna": "Una linterna con luz ultravioleta, pero necesita unas pilas AA para funcionar.",
					"Pilas AAA": "Unas simples pilas AAA.",
					"Aluminio": "Me pregunto que podre hacer con papel metalico.",
					"Pilas AA": "Como las AAA, solo que un poco mas grandes.",
					
					"Libro": "Teoría del colór, tomo 8, un libro muy interesante... mentira, nunca lo leí.",
					"Biblioteca": "Una biblioteca con libros de teoría del arte y grandes artistas.",
					"Compartimiento": "La biblioteca tenía un compartimiento secreto, que será tan privado que este señor tenga que protejer?",
					
					"Cuadro": "'La Mona Lisa', muy buen cuadro debo admitir, aunque de un poco de miedo ya que parece que siempre me esta mirando.",
					
					"Puerta": "Si tengo que ver algo en ella, no lo entiendo... es una simple puerta.",
					"PuertaCerrada": "Está cerrada, y eso que no tiene ningún cerrojo.",
					"Panel": "Es un panel electronico que requiere un código... tal vez abra la puerta.",
					
					"Escultura": "El artista que la está trabajando es realmente talentoso, una pena que deba arrestarlo por intentar raptarme.",
					"Cincel": "Unas herramientas típicas de trabajo para un escultor, pero tambien son útiles para tecnicas de detective.",
					
					"Anotaciones": "Son las anotaciones del artista... pero hay una página marcada.",
					
					"Cuerda": "Zac está atado, lo primero que tenemos que hacer es desatarlo para desperarlo",
					"Cuchillo": "Tal vez este cuchillo pueda cortar esas cuerdas",
					
					"Cajonera": "No hay nada muy interesante en los cajones... pero el ultimo está cerrado.",
					"AbrirCajon": "Ese último cajón enía una linterna, pero requiere unas pilas AA para funcionar.",
					
					"NoCombina": "No creo que esos dos vayan juntos."}


func get_topic(topic):
	for t in descripcion:
		if topic == t:
			emit_signal("topico", topic)

func rand_phrase():
	var rand = randi()%4
	emit_signal("phrase", rand)

func direc_Text(text):
	emit_signal("ayuda", text)
