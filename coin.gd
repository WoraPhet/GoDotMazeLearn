extends Area2D

func _on_Coin_body_entered(body): #ตัวโดนเหรียญ
	if  body.name == "Player":
		queue_free() #Coin หาย
