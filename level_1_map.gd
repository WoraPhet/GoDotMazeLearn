extends Node2D
func _ready():
	TimeTriggerSig.emit_signal("start_timer","show")

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
		# defind State 
		# Define State
	var q0 = node.new("q0")
	var q1 = node.new("q1")
	var q2 = node.new("q2")
	var q3 = node.new("q3")
	var q4 = node.new("q4")
	var q5 = node.new("q5")
	var q6_item = node.new("q6_item")
	var q7 = node.new("q7")
	var q8 = node.new("q8")
	var q9 = node.new("q9")
	var q10 = node.new("q10")
	var q11_enemy = node.new("q11_enemy")
	var q12_item = node.new("q12_item")
	var q13 = node.new("q13")
	var q14 = node.new("q14")
	var q15 = node.new("q15")
	var q16 = node.new("q16")
	var q17 = node.new("q17")
	var q18 = node.new("q18")
	var q19 = node.new("q19")
	var q20 = node.new("q20")
	var q21_final = node.new("q21_final", true)  # Mark q21_final as a final state

	var trap = node.new("trap")
	
	func _init():
			# Set State Transitions
		q0.setTransition(q0, q0, q0, q1)  # InputU, InputD, InputL, InputR
		q1.setTransition(q2, q1, q0, q1)
		q2.setTransition(q3, q1, q2, q2)
		q3.setTransition(q3, q2, q3, q4)
		q4.setTransition(q4, q4, q3, q5)
		q5.setTransition(q6_item, q7, q4, q5)
		q6_item.setTransition(trap, q5, q6_item, q6_item)
		q7.setTransition(q5, trap, q7, q8)
		q8.setTransition(q8, q8, q7, q9)
		q9.setTransition(q9, q9, q8, q10)
		q10.setTransition(q11_enemy, q13, q9, q10)
		q11_enemy.setTransition(q12_item, q10, q11_enemy, q11_enemy)
		q12_item.setTransition(q12_item, q11_enemy, q12_item, trap)
		q13.setTransition(q10, trap, q13, q14)
		q14.setTransition(q14, q14, q13, q15)
		q15.setTransition(q15, q15, q14, q16)
		q16.setTransition(q17, trap, q15, q16)
		q17.setTransition(q18, q16, q17, q17)
		q18.setTransition(q19, q17, q18, q18)
		q19.setTransition(q19, q18, q19, q20)
		q20.setTransition(q20, q10, q19, q21_final)
		q21_final.setTransition(q21_final, q21_final, q20, q21_final)
	
	
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
	get_tree().paused = true
	$pauseMenu.show()

func unpause():
	get_tree().paused = false
	$pauseMenu.hide()



func _on_button_pressed():
	print("inside pause ")
	pause()


func _on_continue_pressed():
	unpause()
