extends Node

var startTime = 30
var sec = startTime
var minute = 0

#func _on_button_pressed():
#	$Timer.start()
func _ready():
	TimeTriggerSig.connect("start_timer",start_timer)
	
func game_time():
	if sec > 0:
		sec -= 1
		$timeStamp.text = str(minute) + ":" + str(sec)
	else:
		sec = startTime - 1
		if minute > 0:
			minute -= 1
			$timeStamp.text = str(minute) + ":" + str(sec)
		else:
			$Timer.stop()
			$timeStamp.hide()
			#$timeStamp.visible = !$timeStamp.visible
			get_tree().change_scene_to_file("res://game_over.tscn")
func _on_timer_timeout():
	game_time()


func start_timer(text):
	if(text == "hide"):
		$timeStamp.hide()
	elif(text == "show"):
		print("FUCK Signalllllllllllllllll")
		$timeStamp.show()
		$Timer.start()
	elif(text == "pause"):
		$Timer.paused = true
	elif(text == "play"):
		$Timer.paused = false
#func _on_test_reset_timer():
	#$Timer.start()
	#print("Signal from biggest ready")
