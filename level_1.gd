extends Node2D
signal resetTime

func _ready():
	emit_signal("resetTime")


func _on_switch_body_entered(body):
	if $Switch/AnimatedSprite2D.frame == 0:
		$Switch/AnimatedSprite2D.frame = 1
		$Door/AnimationPlayer.play("SlideUp")
		$Switch/AudioStreamPlayer2D.play()



