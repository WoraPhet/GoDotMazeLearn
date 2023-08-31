extends CharacterBody2D

var speed = 200
var current_level = 1
var input_queue = []
@onready var animation =  $Sprite2D

func _physics_process(delta):
	while !input_queue.is_empty():
		var char = input_queue.pop_front()
		print(input_queue)
		if Input.is_action_pressed("ui_right") or char == "d":
			position.x += speed * delta
			animation.play("Right")
			get_node("Sprite2D").set_flip_h(false)#not flip
		elif Input.is_action_pressed("ui_left") or char == "a":
			position.x -= speed * delta
			animation.play("Left")
			get_node("Sprite2D").set_flip_h(true)#flip side
		elif Input.is_action_pressed("ui_up") or char == "w":
			position.y -= speed * delta
			animation.play("Up")
		elif Input.is_action_pressed("ui_down") or char == "s":
			position.y += speed * delta
			animation.play("Down")
			
		elif is_on_wall():
			animation.play("idle")
		else:
			animation.play("idle")
		move_and_slide()	


func _on_Player_screen_notifier_2d_screen_exited():
	get_tree().change_scene_to_file("res://level_"+ str(current_level+1) +".tscn")


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		$ProgressBar.value -= 10
	if $ProgressBar.value <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")


func _on_line_edit_text_submitted(new_text):
	var line_edit_text = new_text
	process_value(line_edit_text)
	
func process_value(value: String):
	# Do something with the value, such as printing it
	print("Entered value: ", value)
	for i in value:
		input_queue.append(i)
	print(input_queue)
	# You can call other functions and pass this value if needed
