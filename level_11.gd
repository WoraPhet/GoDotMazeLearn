extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_score_board_mouse_entered():
	$click_sound.play()


func _on_go_back_to_start_menu_btn_mouse_entered():
	$click_sound.play()
