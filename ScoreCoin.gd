extends StaticBody2D

@onready var _animated_sprite = $Coin

func _physics_process(delta):
	_animated_sprite.play("CoinIdle")
