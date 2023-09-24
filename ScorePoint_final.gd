extends Control



func _ready():
	Global.score_minus = 0
	$ProgressBar.value = Global.hp_global
	
func _process(delta):
	$Label.text = "SCORE: " + str(Global.tempScore) #Update score from signal


func _on_fasttyping_hp_decrease_sig():
	$ProgressBar.value = Global.hp_global
	print(Global.hp_global)
