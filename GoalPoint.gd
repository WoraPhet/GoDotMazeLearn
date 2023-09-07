extends StaticBody2D

@onready var _animated_sprite = $Goal1

func _physics_process(delta):
	_animated_sprite.play("Goal1Idle")
