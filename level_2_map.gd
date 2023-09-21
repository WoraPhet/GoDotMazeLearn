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
				# Define State
	var q0 = node.new("q0")
	var q1 = node.new("q1")
	var q2 = node.new("q2")
	var q3 = node.new("q3")
	var q4 = node.new("q4")
	var q5_item = node.new("q5_item")
	var q6 = node.new("q6")
	var q7 = node.new("q7")
	var q8 = node.new("q8")
	var q9 = node.new("q9")
	var q10 = node.new("q10")
	var q11 = node.new("q11")
	var q12 = node.new("q12")
	var q13_enemy = node.new("q13")
	var q14 = node.new("q14")
	var q15 = node.new("q15")
	var q16 = node.new("q16")
	var q17 = node.new("q17")
	var q18 = node.new("q18")
	var q19 = node.new("q19")
	var q20 = node.new("q20")
	var q21_final = node.new("q21_final")  
	var q22 = node.new("q22")
	var q23 = node.new("q23")
	var q24 = node.new("q24")
	var q25 = node.new("q25")
	var q26 = node.new("q26")
	var q27_final = node.new("q27_final",true) # Mark q27_final as a final state

	var trap = node.new("trap")

	
	func _init():
			# Set State Transitions
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q9, q2, q0, q1)
		q2.setTransition(q1, q2, q2, q3)
		q3.setTransition(q3, q3, q2, q4)
		q4.setTransition(q4, q4, q3, q5_item)
		q5_item.setTransition(q6, q5_item, q4, q5_item)
		q6.setTransition(q7, q5_item, q6, q6)
		q7.setTransition(q8, q6, q7, q7)
		q8.setTransition(q15, q7, q8, q16)
		q9.setTransition(q9, q1, q9, q10)
		q10.setTransition(q11, q10, q9, q10)
		q11.setTransition(q12, q10, q11, q11)
		q12.setTransition(q12, q11, q12, q13_enemy)
		q13_enemy.setTransition(q14, q13_enemy, q12, q15)
		q14.setTransition(q14, q13_enemy, q14, q14)
		q15.setTransition(q15, q8, q13_enemy, trap)
		q16.setTransition(trap, q16, q8, q17)
		q17.setTransition(q17, q18, q16, q17)
		q18.setTransition(q17, q19, q18, q18)
		q19.setTransition(q18, trap, q19, q20)
		q20.setTransition(q20, q20, q19, q21_final)
		q21_final.setTransition(q22, q21_final, q20, q21_final)
		q22.setTransition(q23, q21_final, q22, q22)
		q23.setTransition(trap, q22, q23, q24)
		q24.setTransition(q24, q24, q23, q25)
		q25.setTransition(q26, q25, q24, q25)
		q26.setTransition(trap, q25, q26, q27_final)
		q27_final.setTransition(q27_final, q27_final, q26, q27_final)

	
	
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
					#print("turn UP")
					print(presentState.name)
				else:
					DfaSig.emit_signal("DFA_check","8")
					print(presentState.name)
			elif(i == "R"):
				if (presentState.name != presentState.transition_inputR.name):
					presentState = presentState.transition_inputR
					DfaSig.emit_signal("DFA_check","R")
					#print("turn Right")
					print(presentState.name)
				else:
					DfaSig.emit_signal("DFA_check","6")
					print(presentState.name)
					
			elif(i == "D"):
				if (presentState.name != presentState.transition_inputD.name):
					presentState = presentState.transition_inputD
					DfaSig.emit_signal("DFA_check","D")
					#print("turn Down")
					print(presentState.name)
				else:
					DfaSig.emit_signal("DFA_check","2")
					print(presentState.name)
			elif(i == "L"):
				if (presentState.name != presentState.transition_inputL.name):
					presentState = presentState.transition_inputL
					DfaSig.emit_signal("DFA_check","L")
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
