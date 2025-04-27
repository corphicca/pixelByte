extends Area2D

func _on_Hurtbox_area_entered(area):
	if area.is_in_group("attack"):
		get_parent().take_damage(area.damage)
