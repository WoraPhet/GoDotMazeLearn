extends CharacterBody2D


func _on_slime_name_animation_finished():
	$SlimeName.play("SlimeNameAnimation")


func _on_slime_name_ready():
	$SlimeName.play("SlimeNameAnimation")
