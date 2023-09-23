extends CharacterBody2D


var animation_player = AnimationPlayer


func _on_animation_player_ready():
	# Play animate "..." when start
	$AnimatedSprite2D.play("slime")
	
func _on_animation_player_animation_finished(anim_name):
	#repeat
	$AnimatedSprite2D.play("slime") 
