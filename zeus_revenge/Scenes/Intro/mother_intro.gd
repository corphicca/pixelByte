extends Node2D

@onready var animation_player_walk = $walkFront/walkMother
@onready var animation_player_slide = $sideUp/sideUp
@onready var texture_rect1 = $TextureRect
@onready var texture_rect2 = $TextureRect2
@onready var fade_animation_player = $ColorRect/AnimationPlayer 

var should_change_scene := false

func _ready() -> void:
	fade_animation_player.play("fade_in")
	texture_rect1.visible = true
	texture_rect2.visible = false
	
	animation_player_walk.play("motherWalk")
	animation_player_walk.animation_finished.connect(_on_walk_animation_finished)
	animation_player_slide.animation_finished.connect(_on_slide_animation_finished)
	fade_animation_player.animation_finished.connect(_on_fade_animation_finished) 

func _on_walk_animation_finished(anim_name: String) -> void:
	if anim_name == "motherWalk":
		texture_rect1.visible = false
		texture_rect2.visible = true
		$walkFront.hide()
		animation_player_slide.play("slide")

func _on_slide_animation_finished(anim_name: String) -> void:
	if anim_name == "slide":
		fade_animation_player.play("fade_out") 
		should_change_scene = true 

func _on_fade_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_out" and should_change_scene:
		get_tree().change_scene_to_file("res://Scenes/Intro/story2.tscn")
