extends Control

@onready var crashing = $Shaker/Sprite2D/CrashIn
@onready var leave = $ColorRect/Back_out
@onready var shaker = $Shaker # This will be a new Node we'll add
@onready var shake_timer = Timer.new()

func _ready():
	crashing.play("StarCrash")
	leave.play("leave")
	$CenterContainer/VBoxContainer/boxIn.play("boxIn")
	%Play.pressed.connect(play)
	%Settings.pressed.connect(settings)
	%ExitGame.pressed.connect(exitGame)

	# Set up shake timer
	shake_timer.wait_time = 2.02
	shake_timer.one_shot = true
	shake_timer.timeout.connect(start_shake)
	add_child(shake_timer)
	shake_timer.start()

func start_shake():
	# Simple shake by randomly moving the "shaker" node
	shaker.start_shaking()

func play():
	get_tree().change_scene_to_file("res://Scenes/Intro/story.tscn")

func settings():
	get_tree().change_scene_to_file("res://Scenes/Menu/settings.tscn")

func exitGame():
	get_tree().quit()
