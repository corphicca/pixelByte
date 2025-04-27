extends Node2D

var shaking = false
var shake_strength = 10
var shake_timer = 0.5

func start_shaking():
	shaking = true
	shake_timer = 2

func _process(delta):
	if shaking:
		shake_timer -= delta
		if shake_timer <= 0:
			shaking = false
			position = Vector2.ZERO
		else:
			position = Vector2(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength))
