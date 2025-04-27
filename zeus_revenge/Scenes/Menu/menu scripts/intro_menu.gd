extends Control

func _ready():
	%Play.pressed.connect(play)
	%Settings.pressed.connect(settings)
	%ExitGame.pressed.connect(exitGame)

func play():
	get_tree().change_scene_to_file("")

func settings():
	get_tree().change_scene_to_file("res://Scenes/Menu/settings.tscn")

func exitGame():
	get_tree().change_scene_to_file("")
