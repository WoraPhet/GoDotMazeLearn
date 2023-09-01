extends CharacterBody2D

#var currPos = [10,5]
var speed = 6600
const PIXEL_SIZE = 111
var can_walk = true
var timer = null
var step_delay = 2
var current_level = 1
var input_queue = []
var dfa_queue = []
var accept_input_queue = []
@onready var animation =  $Sprite2D
func _ready():
	DfaSig.connect("DFA_check", DFA_check)
"""
func _input(event):
	if event.is_action_pressed("ui_right"):
		currPos[0] +=32
		get_node("Sprite2D").look_at(self.position + Vector2(1,0))
		get_node("CollisionShape2D").look_at(self.position + Vector2(1,0))
		animation.play("Right")
	
	self.position = Vector2(currPos[0], currPos[1])
"""
func _on_timer_timeout():
	print("Time OUT NOW")
	can_walk = true

func _physics_process(delta):
	while !dfa_queue.is_empty() && can_walk:
		var char = dfa_queue.pop_front()
		print(dfa_queue)
		if char == "R":
			position.x += PIXEL_SIZE
			animation.play("Right")
			get_node("Sprite2D").set_flip_h(false)#not flip
			
		elif char == "L":
			position.x -= PIXEL_SIZE
			animation.play("Left")
			get_node("Sprite2D").set_flip_h(true)#flip side
			
		elif  char == "U":
			position.y -= PIXEL_SIZE
			animation.play("Up")
		elif char == "D":
			position.y += PIXEL_SIZE
			animation.play("Down")
		elif char == "6":
			animation.play("Right")
		elif char == "4":
			animation.play("Left")
		elif char == "8":
			animation.play("Up")
		elif char == "2":
			animation.play("Down")
		elif is_on_wall():
			animation.play("idle")
			can_walk = false
		else:
			animation.play("idle")
		move_and_slide()	
		#Disable walk until timer's timeout complete
		can_walk = false
		$Timer.start()
		#start timer
		

func _on_Player_screen_notifier_2d_screen_exited():
	get_tree().change_scene_to_file("res://level_"+ str(current_level+1) +".tscn")


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		$ProgressBar.value -= 10
	if $ProgressBar.value <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")


func _on_text_input_move_text_submitted(new_text):
	var line_edit_text = new_text
	process_value(line_edit_text)
	
func process_value(value: String):
	# Do something with the value, such as printing it
	value = value.to_upper()
	print("Entered value: ", value)
	for i in value:
		input_queue.append(i)
	print(input_queue)
	# You can call other functions and pass this value if needed


func DFA_check(text):
	dfa_queue.append(text)
	print(dfa_queue)
	
