extends AnimatedSprite2D


func _on_hat_man_area_2d_area_entered(area: Area2D) -> void:
	get_tree().paused = true
	if animation == "default":
		play("shrink")
	elif animation == "shrink":
		play("grow")
	else:
		play("shrink")


func _on_animation_finished() -> void:
	get_tree().paused = false
