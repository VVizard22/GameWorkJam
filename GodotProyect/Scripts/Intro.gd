extends Control

func _ready():
	var intro = get_node("Intro")
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
	intro.play("Trans4")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("5")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans5")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("6")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans6")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("7")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans7")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("8")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans8")
	yield(get_tree().create_timer(.6), "timeout")
	intro.play("9")
	yield(get_tree().create_timer(4), "timeout")
	intro.play("Trans9")
	yield(get_tree().create_timer(.6), "timeout")
	
	Loader._changeScene("Tutorial", "Wipe")


func _on_TextureButton_pressed():
	Loader._changeScene("Tutorial", "Wipe")
