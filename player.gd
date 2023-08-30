extends CharacterBody2D

var speed = 200
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
	else:
		animation.play("idle")
