extends Area2D


func _on_body_entered(body):
	if  body.name == "Player":
		print("Touchhhhhhhhhhhhhhhhhhhhhh")
		queue_free() #Monster หาย
		emit_signal("MonsterD1Sig")
		
