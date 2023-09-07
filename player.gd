extends CharacterBody2D


var speed = 6600
const PIXEL_SIZE = 111
var can_walk = true
var timer = null
var step_delay = 2
var current_level = 1
var dfa_queue = []
var accept_input_queue = []
var defaultPosX = position.x
var defaultPosY = position.y

@onready var animation =  $Sprite2D
func _ready():
	DfaSig.connect("DFA_check", DFA_check)

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
		elif char == "Z":
			Global.score += Global.score_minus
			get_tree().change_scene_to_file("res://level_"+ str(current_level+1) +".tscn")
		elif char == "N":
			#Global.score -= Global.score_minus
			get_tree().change_scene_to_file("res://test.tscn")
			
		else:
			animation.play("idle")
		move_and_slide()	
		#Disable walk until timer's timeout complete
		can_walk = false
		$Timer.start()
		
func _on_Player_screen_notifier_2d_screen_exited():
	get_tree().change_scene_to_file("res://level_"+ str(current_level+1) +".tscn")


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		$ProgressBar.value -= 10
	if $ProgressBar.value <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")


func DFA_check(text):
	dfa_queue.append(text)
	print(dfa_queue)
	
