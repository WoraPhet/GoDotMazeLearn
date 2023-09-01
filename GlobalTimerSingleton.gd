extends Node


var global_timer

func _init():
	global_timer = preload("res://game_over.tscn").new()
	add_child(global_timer)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
