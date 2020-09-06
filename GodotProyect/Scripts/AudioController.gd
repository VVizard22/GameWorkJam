extends Node

var currently
var currentSfx


func Play(Song):
	if currently == "Intro" or currently == "MainSong":
		get_node(currently).stop()
	currently = Song
	get_node(currently).play()

func SfxPlay(sfx):
	currentSfx = sfx
	get_node(sfx).play()

func SfxStop():
	if currentSfx != null:
		get_node(currentSfx).stop()
