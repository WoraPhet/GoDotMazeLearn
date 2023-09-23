extends CharacterBody2D

func _on_slime_stand_ready():
	# Play animate "..." when start
	$SlimeStand.play("SlimeAni")

func _on_slime_stand_animation_finished():
	#repeat
	$SlimeStand.play("SlimeAni")
