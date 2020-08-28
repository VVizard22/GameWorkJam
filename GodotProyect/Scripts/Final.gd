extends Control

func _ready():
	var intro = get_node("Final")
	intro.play("1")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans1")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("2")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans2")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("3")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans3")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("4")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("5")
	
func _on_TextureButton_pressed():
	Loader._changeScene("Menu", "Wipe")
