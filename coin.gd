extends Area2D

signal coin_collected
var score_local = 0

func _on_Coin_body_entered(body): #ตัวโดนเหรียญ
	if  body.name == "Player":
		print("Touchhhhhhhhhhhhhhhhhhhhhh")
		Global.score_minus += 1
		print(Global.score)
		
		emit_signal("coin_collected")
		$CoinCollected.play()
		$AnimationPlayer.play("CoinCollected")
		
		


func _on_coin_collected_finished():
	queue_free() #Coin หาย
