extends CharacterBody2D

@export var full_heart_texture: Texture2D
@export var empty_heart_texture: Texture2D
@onready var hearts_container = $"../UI/HBoxContainer" # adjust the path if needed
	
@export var max_health: int = 3
var current_health: int

@onready var sprite = $AnimatedSprite2D

var speed = 100

func _ready():
	current_health = max_health
	update_hearts()
	
func take_damage(amount: int) -> void:
	current_health -= 1
	update_hearts()
	if current_health <= 0:
		die()

func die() -> void:
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()


func _physics_process(delta):
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector.normalized() * speed
		move_and_slide()

		# Play correct walking animation
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				sprite.play("walk right")
			else:
				sprite.play("walk left")
		else:
			if input_vector.y > 0:
				sprite.play("walk forward")
			else:
				sprite.play("walk back")
	else:
		velocity = Vector2.ZERO
		sprite.play("default")  # idle
		
func update_hearts():
	# Clear old hearts
	for child in hearts_container.get_children():
		child.queue_free()

	# Add one heart per max health
	for i in range(max_health):
		var heart = TextureRect.new()
		heart.texture = full_heart_texture if i < current_health else empty_heart_texture
		heart.custom_minimum_size = Vector2(32, 32) # or whatever size you want
		hearts_container.add_child(heart)
