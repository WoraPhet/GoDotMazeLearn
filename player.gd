extends CharacterBody2D

var speed = 200
var current_level = 1
@onready var animation =  $Sprite2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		animation.play("Right")
		get_node("Sprite2D").set_flip_h(false)#not flip
	elif Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
		animation.play("Left")
		get_node("Sprite2D").set_flip_h(true)#flip side
	elif Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
		animation.play("Up")
	elif Input.is_action_pressed("ui_down"):
		position.y += speed * delta
		animation.play("Down")
	elif is_on_wall():
		animation.play("idle")
	else:
		animation.play("idle")
	move_and_slide()	


func _on_Player_screen_notifier_2d_screen_exited():
	get_tree().change_scene_to_file("res://level_"+ str(current_level+1) +".tscn")


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		$ProgressBar.value -= 10
