extends Area2D

signal coin_collected

func _on_Coin_body_entered(body): #ตัวโดนเหรียญ
	if  body.name == "Player":
		Global.score += 1
		emit_signal("coin_collected")
		$CoinCollected.play()
		$AnimationPlayer.play("CoinCollected")
		
		


func _on_coin_collected_finished():
	queue_free() #Coin หาย
