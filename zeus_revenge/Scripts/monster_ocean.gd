extends CharacterBody2D

@onready var character = $"../../CharacterBody2D"
@onready var timer = $Timer
@onready var pos = $"."  # This refers to the current node
@onready var vis = $VFX
@onready var attack_time = $attack  # Fix variable name to snake_case (Godot style)
var vfx

func _ready() -> void:
	timer.start()
	vfx = character.get_node("AnimatedSprite2D2")

func _on_timer_timeout() -> void:
<<<<<<< HEAD
=======
	print("Attack")
	
>>>>>>> 350694c24bbd70c39a2e66fb3fe0aa239090442f
	var distance = character.global_position.distance_to(pos.global_position)
	if distance <= 250:
		vfx.show()
		vfx.play("Aim")
		attack_time.start()
		timer.stop()

func _on_attack_timeout() -> void:
	vfx.hide()
	attack_time.stop()
	vis.show()
	vis.global_position = character.global_position
	vis.play("water")
	timer.start()

func _on_vfx_animation_finished() -> void:
	vis.hide()

func _on_kill_zone_body_entered(body: Node2D) -> void:
	print("Player damaged")
