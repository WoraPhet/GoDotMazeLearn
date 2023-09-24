extends Node

func _ready()-> void:
	var Label_text_res = "res://high-score.txt"
	var file = FileAccess.open(Label_text_res, FileAccess.READ)
	var text = file.get_as_text()
	
	var lines = text.split("\n")
	var dict = []

	for line in lines:
		var parts = line.split(":")
		
		if parts.size() == 2:
			var name = parts[0].replace("\\", "")
			var score = int(parts[1].replace("\\", ""))
			dict.append({"name":name,"score":score})
	print("\n")
	dict.sort_custom(sort_score)
	print(dict)
	var top5Scores = dict.slice(0, min(5, dict.size()))
	var scoreText = ""
	for i in range(top5Scores.size()):
		scoreText += top5Scores[i]["name"]+ ":"+ str(top5Scores[i]["score"]) + "\n"
	$CanvasLayer/Main/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/score2.text = scoreText
	
	file.close()
	
func sort_score(a,b):
		if a["score"] > b["score"]:
			return true
		return false


func _on_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn") #StartPage
