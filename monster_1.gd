extends CharacterBody2D

var speed = 100
var direction = 1 #right

func _physics_process(delta):
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
	position.x += speed * delta * direction
	move_and_slide()
