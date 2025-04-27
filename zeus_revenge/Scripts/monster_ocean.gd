extends CharacterBody2D

@onready var character = $"../../CharacterBody2D"
@onready var timer = $Timer
@onready var pos = $"."
@onready var vis = $VFX
var vfx;

func _ready() -> void:
	timer.start()
	vfx = vis.get_node("AnimatedSprite2D2")

func _on_timer_timeout() -> void:
	var distance = character.global_position.distance_to(pos.global_position)
	if distance <= 250:
		vfx.visibile = true
		vfx.play("Aim")
