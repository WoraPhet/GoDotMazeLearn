extends Node2D




func _on_switch_body_entered(body):
	if $Switch/AnimatedSprite2D.frame == 0:
		$Switch/AnimatedSprite2D.frame = 1
		$Door/AnimationPlayer.play("SlideUp")
