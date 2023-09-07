extends StaticBody2D

@onready var _animated_sprite = $Start1

func _physics_process(delta):
	_animated_sprite.play("Start1Idle")
