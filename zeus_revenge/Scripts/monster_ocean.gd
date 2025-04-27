extends CharacterBody2D

@onready var character = $"../../CharacterBody2D"
@onready var timer = $Timer
@onready var pos = $"."
@onready var vis = $VFX
@onready var Attck_time = $attack
var vfx;

func _ready() -> void:
	timer.start()
	vfx = character.get_node("AnimatedSprite2D2")

func _on_timer_timeout() -> void:
	print("Attack")
	
	var distance = character.global_position.distance_to(pos.global_position)
	if distance <= 250:
		vfx.show()
		vfx.play("Aim")
		Attck_time.start()
		timer.stop()

func _on_attack_timeout() -> void:
	vfx.hide()
	Attck_time.stop()
	vis.show()
	vis.global_position = character.global_position
	vis.play("water")
	vis.animation_finished
	timer.start()

func _on_vfx_animation_finished() -> void:
	vis.hide()

func _on_kill_zone_body_entered(body: Node2D) -> void:
	print("Player damaged")
