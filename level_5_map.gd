extends Node2D
signal monster1Pause
func _ready():
	TimeTriggerSig.emit_signal("start_timer","show")
	Global.current_map_for_file = 5

class node:
	var name:String
	var is_final_state:bool = false
	var transition_inputU:node
	var transition_inputD:node
	var transition_inputL:node
	var transition_inputR:node
	
	func _init(Name: String = "", is_final:bool = false):
		name  = Name
		is_final_state = is_final
	
	func setTransition(transition_InputU:node, transition_InputD:node,transition_InputL:node,transition_InputR:node):
		transition_inputU = transition_InputU
		transition_inputD = transition_InputD
		transition_inputL =transition_InputL
		transition_inputR = transition_InputR
	
class myDFA_L1:
	#Define State
	var q0 = node.new("q0")
	var q1 = node.new("q1")
	var q2 = node.new("q2")
	var q3_enemy = node.new("q3_enemy")
	var q4_item = node.new("q4_item")
	var q5 = node.new("q5")
	var q6 = node.new("q6")
	var q7 = node.new("q7")
	var q8_hard_enemy = node.new("q8_hard_enemy")
	var q9 = node.new("q9")
	var q10 = node.new("q10")
	var q11 = node.new("q11")
	var q12 = node.new("q12")
	var q13_final = node.new("q13_final", true)
	var q14 = node.new("q14")
	var q15 = node.new("q15")
	var q16 = node.new("q16")
	var q17 = node.new("q17")
	var q18 = node.new("q18")
	var q19 = node.new("q19")
	var q20 = node.new("q20")
	var q21 = node.new("q21")
	var q22 = node.new("q22")
	var q23 = node.new("q23")
	var q24 = node.new("q24")
	var q25 = node.new("q25")
	var q26 = node.new("q26")
	var q27 = node.new("q27")
	var q28 = node.new("q28")
	var q29 = node.new("q29")
	var q30 = node.new("q30")
	var q31 = node.new("q31")
	var q32_item = node.new("q32_item")
	var q33 = node.new("q33")

	var trap = node.new("trap")

	
	func _init():
		# Set transitions for the nodes
		#UDLR
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q15, q14, q0, q2)
		q2.setTransition(trap, trap, q1, q3_enemy)
		q3_enemy.setTransition(trap, q4_item, q2, trap)
		q4_item.setTransition(q3_enemy, q4_item, trap, q5)
		q5.setTransition(trap, q5, q4_item, q6)
		q6.setTransition(trap, q6, q5, q7)
		q7.setTransition(q8_hard_enemy, q7, q6, trap)
		q8_hard_enemy.setTransition(q24, q7, trap, q9)
		q9.setTransition(trap, trap, q8_hard_enemy, q10)
		q10.setTransition(q32_item, trap, q9, q11)
		q11.setTransition(q31, q33, q10, q12)
		q12.setTransition(q12, q12, q11, q13_final)
		q13_final.setTransition(q13_final, q14, q0, q1)
		q14.setTransition(q13_final, q13_final, q12, q13_final)
		q15.setTransition(q16, q1, q15, trap)
		q16.setTransition(q17, q15, q16, trap)
		q17.setTransition(q17, q16, q17, q18)
		q18.setTransition(q18, trap, q17, q19)
		q19.setTransition(q19, q20, q18, trap)
		q20.setTransition(q19, trap, trap, q21)
		q21.setTransition(trap, q22, q20, trap)
		q22.setTransition(q21, trap, trap, q23)
		q23.setTransition(trap, trap, q22, q24)
		q24.setTransition(q25, q8_hard_enemy, q23, trap)
		q25.setTransition(q26, q24, trap, trap)
		q26.setTransition(q26, q25, trap, q27)
		q27.setTransition(q27, trap, q26, q28)
		q28.setTransition(q28, trap, q27, q29)
		q29.setTransition(q29, q30, q28, q29)
		q30.setTransition(q29, q31, trap, q30)
		q31.setTransition(q30, q11, q32_item, q31)
		q32_item.setTransition(trap, q10, trap, q31)
		q33.setTransition(q11, q33, trap, q33)



	
	
	func determine(input: String):
		var presentState = node.new()
		presentState = q0
		print(input)
		print(presentState.name)
		for i in input:
			if(i == "U"):
				if (presentState.name != presentState.transition_inputU.name):
					presentState = presentState.transition_inputU
					DfaSig.emit_signal("DFA_check","U")
					if(presentState.name == "trap"):
						DfaSig.emit_signal("DFA_check","F")
						DfaSig.emit_signal("DFA_check","")
						DfaSig.emit_signal("DFA_check","")
						break
					#print("turn UP")
					print(presentState.name)
				else:
					DfaSig.emit_signal("DFA_check","8")
					print(presentState.name)
			elif(i == "R"):
				if (presentState.name != presentState.transition_inputR.name):
					presentState = presentState.transition_inputR
					DfaSig.emit_signal("DFA_check","R")
					if(presentState.name == "trap"):
						DfaSig.emit_signal("DFA_check","F")
						DfaSig.emit_signal("DFA_check","")
						DfaSig.emit_signal("DFA_check","")
						break
					#print("turn Right")
					print(presentState.name)
				else:
					DfaSig.emit_signal("DFA_check","6")
					print(presentState.name)
					
			elif(i == "D"):
				if (presentState.name != presentState.transition_inputD.name):
					presentState = presentState.transition_inputD
					DfaSig.emit_signal("DFA_check","D")
					if(presentState.name == "trap"):
						DfaSig.emit_signal("DFA_check","F")
						DfaSig.emit_signal("DFA_check","")
						DfaSig.emit_signal("DFA_check","")
						break
					#print("turn Down")
					print(presentState.name)
				else:
					DfaSig.emit_signal("DFA_check","2")
					print(presentState.name)
			elif(i == "L"):
				if (presentState.name != presentState.transition_inputL.name):
					presentState = presentState.transition_inputL
					DfaSig.emit_signal("DFA_check","L")
					if(presentState.name == "trap"):
						DfaSig.emit_signal("DFA_check","F")
						DfaSig.emit_signal("DFA_check","")
						DfaSig.emit_signal("DFA_check","")
						break
					#print("turn Left")
					print(presentState.name)
				else:
					DfaSig.emit_signal("DFA_check","4")
					print(presentState.name)
			elif(i == "P"):
				DfaSig.emit_signal("DFA_check","P")
		return presentState.is_final_state
# Called when the node enters the scene tree for the first time.	
	
	
func _on_text_input_move_text_submitted(new_text):
	var inpToDFA = myDFA_L1.new()
	var is_complete = inpToDFA.determine(new_text.to_upper())
	if(is_complete):
		print(is_complete)
		
		DfaSig.emit_signal("DFA_check","Z")
	else:
		print(is_complete)
		
		DfaSig.emit_signal("DFA_check","N")
		
func pause():
	#$Fasttyping.show()
	emit_signal("monster1Pause")
	get_tree().paused = true
	$pauseMenu.show()

func unpause():
	#$/root/TestGamMain/Fasttyping.hide()
	get_tree().paused = false
	$pauseMenu.hide()


func _on_fasttyping_exit_monster_d_1():
	unpause()


func _on_monster_5_1_body_entered(body):
	pause()


func _on_monster_5_2_body_entered(body):
	pause()
