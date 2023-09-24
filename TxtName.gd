extends Node2D
func _on_ok_button_pressed():
	#var file = FileAccess.open("res://p_name.txt",FileAccess.READ_WRITE)
	#file.seek_end()
	#file.store_line("new_text")
	#file.close()
	get_tree().change_scene_to_file("res://level_1.tscn")
	
	
#func _on_input_name_text_submitted(new_text):
#	var file = FileAccess.open("res://high-score.txt",FileAccess.READ_WRITE)
#	file.seek_end()
#	file.store_line(new_text + ": 0")
#	file.close()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
	

func _on_next_button_pressed():
	#var file = FileAccess.open("res://high-score.txt",FileAccess.READ_WRITE)
	#file.seek_end()
	#file.store_line(Global.nameSet + ":0")
	#file.close()
	GameTimeUI.sec = 601
	Global.current_level = 1
	Global.hp_global = 100
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_input_name_text_changed(new_text):
	Global.nameSet = new_text


func _on_back_button_mouse_entered():
	$click_sound.play()


func _on_next_button_mouse_entered():
	$click_sound.play()
