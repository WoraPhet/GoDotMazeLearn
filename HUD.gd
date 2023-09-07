extends Control



func _ready():
	Global.score_minus = 0
func _process(delta):
	$Label.text = "SCORE: " + str(Global.score+Global.score_minus) #Update score from signal
