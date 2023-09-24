extends Node2D
signal monster1Pause
func _ready():
	TimeTriggerSig.emit_signal("start_timer","show")
	Global.current_map_for_file = 3

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
	# Define State
	var q0 = node.new("q0")
	var q1 = node.new("q1")
	var q2 = node.new("q2")
	var q3 = node.new("q3")
	var q4 = node.new("q4")
	var q5 = node.new("q5")
	var q6 = node.new("q6")
	var q7_item = node.new("q7_item")
	var q8 = node.new("q8")
	var q9 = node.new("q9")
	var q10 = node.new("q10")
	var q11_enemy = node.new("q11_enemy")
	var q12 = node.new("q12")
	var q13 = node.new("q13")
	var q14_item = node.new("q14_item")
	var q15 = node.new("q15")
	var q16 = node.new("q16")
	var q17 = node.new("q17")
	var q18 = node.new("q18")
	var q19 = node.new("q19")
	var q20 = node.new("q20")
	var q21 = node.new("q21")
	var q22 = node.new("q22")
	var q23_item = node.new("q23_item")
	var q24 = node.new("q24")
	var q25 = node.new("q25")
	var q26 = node.new("q26")
	var q27 = node.new("q27")
	var q28_final = node.new("q28_final", true)  # Mark q28_final as a final state
	var trap = node.new("trap")

	
	func _init():
		# Set State Transitions
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q2, q1, q0, q1)
		q2.setTransition(q3, q1, q2, q2)
		q3.setTransition(q3, q2, q3, q4)
		q4.setTransition(q5, q4, q3, q8)
		q5.setTransition(q6, q4, q5, q5)
		q6.setTransition(q6, q5, q6, q7_item)
		q7_item.setTransition(q7_item, q7_item, q6, trap)
		q8.setTransition(q8, q9, q4, q15)
		q9.setTransition(q8, q10, q9, trap)
		q10.setTransition(q9, q10, q10, q11_enemy)
		q11_enemy.setTransition(trap, q12, q10, q13)
		q12.setTransition(q11_enemy, q12, q12, q12)
		q13.setTransition(q14_item, q13, q11_enemy, q13)
		q14_item.setTransition(q16, q13, trap, q14_item)
		q15.setTransition(q15, trap, q8, q16)
		q16.setTransition(q16, q14_item, q15, q17)
		q17.setTransition(q17, q17, q16, q18)
		q18.setTransition(q19, q18, q17, q18)
		q19.setTransition(q20, q18, q19, q19)
		q20.setTransition(q20, q19, q21, q22)
		q21.setTransition(q21, q21, q21, q20)
		q22.setTransition(q22, q22, q20, q23_item)
		q23_item.setTransition(q23_item, q24, q22, q23_item)
		q24.setTransition(q23_item, q25, q24, q24)
		q25.setTransition(q24, q26, q25, q25)
		q26.setTransition(q25, q26, q26, q27)
		q27.setTransition(q27, q27, q26, q28_final)
		q28_final.setTransition(q28_final, q28_final, q27, q28_final)


	
	
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


func _on_monster_d_1_body_entered(body):
	pause()
