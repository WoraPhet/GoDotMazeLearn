extends Node2D
signal monster1Pause
func _ready():
	TimeTriggerSig.emit_signal("start_timer","show")
	Global.current_map_for_file = 10

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
	var q7 = node.new("q7")
	var q8 = node.new("q8")
	var q9 = node.new("q9")
	var q10 = node.new("q10")
	var q11 = node.new("q11")
	var q12_final = node.new("q12_final", true)
	var q13 = node.new("q13")
	var q14 = node.new("q14")
	var q15 = node.new("q15")
	var q16 = node.new("q16")
	var q17 = node.new("q17")
	var q18 = node.new("q18")
	var q19 = node.new("q19")
	var q20_item = node.new("q20_item")
	var q21 = node.new("q21")
	var q22 = node.new("q22")
	var q23 = node.new("q23")
	var q24 = node.new("q24")
	var q25 = node.new("q25")
	var q26_item = node.new("q26_item")
	var q27_hard_enemy = node.new("q27_hard_enemy")
	var q28 = node.new("q28")
	var q29 = node.new("q29")
	var q30 = node.new("q30")
	var q31 = node.new("q31")
	var q32 = node.new("q32")
	var q33 = node.new("q33")
	var q34_hard_enemy = node.new("q34_hard_enemy")
	var q35_item = node.new("q35_item")
	var q36 = node.new("q36")

	var trap = node.new("trap")

	
	func _init():
		# Set transitions for the nodes
		q0.setTransition(q0, q13, q0, q1)
		q1.setTransition(q1, trap, q0, q2)
		q2.setTransition(q2, trap, q1, q3)
		q3.setTransition(q3, q4, q2, q3)
		q4.setTransition(q3, q23, trap, q5)
		q5.setTransition(q5, q5, q4, q6)
		q6.setTransition(q6, q7, q5, q6)
		q7.setTransition(q6, q32, q7, q8)
		q8.setTransition(q8, trap, q7, q9)
		q9.setTransition(q10, q36, q8, q9)
		q10.setTransition(q10, q9, q10, q11)
		q11.setTransition(q11, q11, q10, q12_final)
		q12_final.setTransition(q12_final, q12_final, q11, q12_final)
		q13.setTransition(q0, trap, q14, trap)
		q14.setTransition(q14, trap, q15, q13)
		q15.setTransition(q15, q16, q15, q14)
		q16.setTransition(q15, q17, q16, trap)
		q17.setTransition(q16, q17, q17, q18)
		q18.setTransition(trap, q31, q17, q19)
		q19.setTransition(trap, trap, q18, q20_item)
		q20_item.setTransition(q21, trap, q19, trap)
		q21.setTransition(trap, q20_item, trap, q22)
		q22.setTransition(trap, trap, q21, q23)
		q23.setTransition(q4, q24, q22, q23)
		q24.setTransition(q23, q25, trap, q24)
		q25.setTransition(q24, q26_item, trap, q25)
		q26_item.setTransition(q25, q26_item, q27_hard_enemy, q26_item)
		q27_hard_enemy.setTransition(trap, q27_hard_enemy, q28, q26_item)
		q28.setTransition(trap, q28, q29, q27_hard_enemy)
		q29.setTransition(trap, q29, q30, q28)
		q30.setTransition(q31, q30, q30, q29)
		q31.setTransition(q18, q30, q31, trap)
		q32.setTransition(q7, q33, q32, trap)
		q33.setTransition(q32, q33, q33, q34_hard_enemy)
		q34_hard_enemy.setTransition(trap, q34_hard_enemy, q33, q35_item)
		q35_item.setTransition(q36, q35_item, q34_hard_enemy, q35_item)
		q36.setTransition(q9, q35_item, trap, q36)



	
	
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


func _on_monster_9_body_entered(body):
	pause()
