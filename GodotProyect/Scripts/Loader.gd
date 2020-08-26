extends Node

var currentScene
onready var wipeTransition = WipeTransition.get_node("AnimationPlayer")
var escenas = {
	"ArtRoom": "res://Scenes/Juego/SalaDeArte.tscn",
	"Menu": "res://Scenes/Menu/MainMenu.tscn",
	"Opciones": "",
	"Tutorial": "res://Scenes/Juego/Tutorial.tscn",
	"Panel": "res://Scenes/Juego/Panel.tscn",
	"PauseMenu": ""
}

func _ready():
	currentScene = "Menu"

func _changeScene(scene, transition):
	if(transition != "none"):
		wipeTransition.play(transition)
		yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene_to(load(escenas[scene]))
	currentScene = scene
