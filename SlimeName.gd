extends AnimatedSprite2D


func _on_slime_name_ready():
	# Play animate "..." when start
	$SlimeName.play("slimeNameAni")

func _on_slime_name_animation_finished():
	#repeat
	$SlimeName.play("slimeNameAni")
