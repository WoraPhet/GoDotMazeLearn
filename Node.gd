extends Node
# Called when the node enters the scene tree for the first time.

#@onready var line_edit = $CanvasLayer/Control2/LineEdit
#signal get_name(namevar Name = "res://Name.txt

func _ready()-> void:
	var Label_text_res = "res://high-score.txt"
	var file = FileAccess.open(Label_text_res,FileAccess.READ)
	var text = file.get_as_text()
	#var text = "hello"
	print_debug(text)
	$CanvasLayer/Main/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/score2.text = text
	#score.visible = true

	
	#func _process(delta: float) -> void:
#	if playing:
		#$Gameplay/TimerCountdown.text = "Time Left: %s" % roundf(timer.time_left)

	




func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn") #StartPage
