extends Node2D

@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	animation_player.play("fade_in")
	%Button.pressed.connect(next)

func next():
	animation_player.play("fade_out")
	await get_tree().create_timer(5).timeout 
	get_tree().change_scene_to_file("res://Scenes/Levels/Ocean_Level/ocean_level.tscn")
