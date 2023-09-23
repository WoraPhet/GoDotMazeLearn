extends CharacterBody2D


#var speed = 6600
const PIXEL_SIZE = 64
var can_walk = true
#var timer = null
#var step_delay = 2

var dfa_queue = []

#var accept_input_queue = []
#var defaultPosX = position.x
#var defaultPosY = position.y

@onready var animation =  $Sprite2D
func _ready():
	DfaSig.connect("DFA_check", DFA_check)

func _on_timer_timeout():
	print("Time OUT NOW")
	can_walk = true

func _physics_process(delta):
	if (Global.hp_global <= 0):
		GameTimeUI.sec = 0
	if dfa_queue.is_empty():
		animation.play("idle")
	elif(!dfa_queue.is_empty() && can_walk):
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
		elif char == "F":
			GameTimeUI.sec = 0
		elif char == "Z":
			Global.score += Global.score_minus
			if(Global.hp_global <= 100):
				Global.hp_global += 20
				if(Global.hp_global > 100):
					Global.hp_global = 100
			Global.current_level += 1
			get_tree().change_scene_to_file("res://level_"+ str(Global.current_level) +".tscn")
		elif char == "N":
			#Global.score -= Global.score_minus
			get_tree().change_scene_to_file("res://level_"+ str(Global.current_level) +".tscn")
			
		#else:
		#	animation.play("idle")
		move_and_slide()	
		#Disable walk until timer's timeout complete
		can_walk = false
		$Timer.start()
		
func _on_Player_screen_notifier_2d_screen_exited():
	get_tree().change_scene_to_file("res://level_"+ str(Global.current_level+1) +".tscn")



func DFA_check(text):
	dfa_queue.append(text)
	print(dfa_queue)
	
