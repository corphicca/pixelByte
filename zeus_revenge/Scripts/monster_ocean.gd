extends CharacterBody2D

@onready var character = $"../CharacterBody2D"
@onready var timer = $Timer

func _ready() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	print("Attack")
	print(character.position)
