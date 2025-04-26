extends Node2D

var button_type = null

func _ready() -> void:
	$FadeTransition.show()
	$FadeTransition/AnimationPlayer.play("Fade_Out")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	print("Animation finished:", anim_name)
	if anim_name == "Fade_Out":
		$FadeTransition.hide()

func _on_start_pressed() -> void:
	button_type = "start"
	$FadeTransition.show()
	$FadeTransition/Fade_timer.start()
	$FadeTransition/AnimationPlayer.play("Fade_In")
	


func _on_options_pressed() -> void:
	button_type = "options"
	$FadeTransition.show()
	$FadeTransition/Fade_timer.start()
	$FadeTransition/AnimationPlayer.play("Fade_In")


func _on_exit_game_pressed() -> void:
	get_tree().quit()


func _on_fade_timer_timeout() -> void:
	if button_type == "start" :
		get_tree().change_scene_to_file("")
	elif button_type ==  "options" :
		get_tree().change_scene_to_file("")
