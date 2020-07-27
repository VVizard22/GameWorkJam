extends MarginContainer


export (PackedScene) var game_scn
export (PackedScene) var options_scn #Falta cargar escena y crearla

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func play_pressed():
	get_tree().change_scene_to(game_scn)


func options_pressed():
	get_tree().change_scene_to(options_scn)
