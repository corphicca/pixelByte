extends Control

@onready var crashing = $Sprite2D/CrashIn
@onready var leave = $ColorRect/Back_out

@export var randomStrength: float = 30.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

func apply_shake():
	shake_strength = randomStrength
	
func randomOffset() -> Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))

func _ready():
	crashing.play("StarCrash")
	leave.play("leave")
	%Play.pressed.connect(play)
	%Settings.pressed.connect(settings)
	%ExitGame.pressed.connect(exitGame)

func play():
	get_tree().change_scene_to_file("res://Scenes/Intro/MotherIntro.tscn")

func settings():
	get_tree().change_scene_to_file("res://Scenes/Menu/settings.tscn")

func exitGame():
	get_tree().quit()
