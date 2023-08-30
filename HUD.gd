extends Control

func _ready():
	$Label.text = "SCORE: " + str(Global.score)


func _on_coin_collected():
	_ready() #Update score from signal
