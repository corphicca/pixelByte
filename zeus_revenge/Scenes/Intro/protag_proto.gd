extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D


var speed = 100

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

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
		sprite.play("default")  # Play idle animation or stop
