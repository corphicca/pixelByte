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
<<<<<<< HEAD
	print("Attack")
	
=======
	var distance = character.global_position.distance_to(pos.global_position)
	if distance <= 250:
		vfx.show()
		vfx.play("Aim")
		Attck_time.start()
		timer.stop()

func _on_attack_timeout() -> void:
	vfx.hide()
	Attck_time.stop()
	timer.start()
>>>>>>> 0a93c55856157b0920fb3afa036ed314d77fbb7b
