extends Node2D
func _ready():
	TimeTriggerSig.emit_signal("start_timer","show")
	Global.current_map_for_file = 6

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
	var q11_hard_enemy = node.new("q11_hard_enemy")
	var q12_item = node.new("q12_item")
	var q13 = node.new("q13")
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
	var q30_final = node.new("q30_final",true)
	var q31 = node.new("q31")
	var q32 = node.new("q32")
	var q33_hard_enemy = node.new("q33_hard_enemy")
	var q34_item = node.new("q34_item")
	var q35 = node.new("q35")
	var q36 = node.new("q36")
	var q37 = node.new("q37")
	var q38 = node.new("q38")
	var q39_hard_enemy = node.new("q39_hard_enemy")
	var q40_item = node.new("q40_item")
	var q41 = node.new("q41")
	var q42_hard_enemy = node.new("q42_hard_enemy")
	var q43_item = node.new("q43_item")
	var q44 = node.new("q44")
	var q45 = node.new("q45")
	var trap = node.new("trap")

	
	func _init():
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q2, q9, q0, q1)
		q2.setTransition(q3, q1, q2, q2)
		q3.setTransition(q4, q2, q3, trap)
		q4.setTransition(trap, q3, q4, q5)
		q5.setTransition(trap, trap, q4, q6)
		q6.setTransition(trap, q7, q5, q6)
		q7.setTransition(q6, trap, trap, q8)
		q8.setTransition(q8, q14, q7, q15)
		q9.setTransition(q1, q9, q9, q10)
		q10.setTransition(q10, q10, q9, q11_hard_enemy)
		q11_hard_enemy.setTransition(q12_item, q11_hard_enemy, q10, q11_hard_enemy)
		q12_item.setTransition(trap, q11_hard_enemy, q12_item, q13)
		q13.setTransition(q14, q13, q12_item, q31)
		q14.setTransition(q8, q13, trap, trap)
		q15.setTransition(q16, trap, q8, trap)
		q16.setTransition(trap, q15, q16, q17)
		q17.setTransition(trap, trap, q16, q18)
		q18.setTransition(trap, q19, q17, q18)
		q19.setTransition(q18, trap, trap, q20)
		q20.setTransition(q20, trap, q19, q21)
		q21.setTransition(q22, trap, q20, trap)
		q22.setTransition(trap, q21, q22, q23)
		q23.setTransition(trap, trap, q22, q24)
		q24.setTransition(trap, q25, q23, q24)
		q25.setTransition(q24, trap, trap, q26)
		q26.setTransition(q26, q26, q25, q27)
		q27.setTransition(q29, q27, q26, q28)
		q28.setTransition(q28, q45, q27, q28)
		q29.setTransition(q30_final, q27, q29, q29)
		q30_final.setTransition(q30_final, q29, q30_final, q30_final)
		q31.setTransition(trap, q31, q13, q32)
		q32.setTransition(q32, q32, q31, q33_hard_enemy)
		q33_hard_enemy.setTransition(trap, q34_item, q32, q33_hard_enemy)
		q34_item.setTransition(q33_hard_enemy, q34_item, q34_item, q35)
		q35.setTransition(q35, q35, q34_item, q36)
		q36.setTransition(q37, q36, q35, q36)
		q37.setTransition(trap, q36, q37, q38)
		q38.setTransition(q38, q38, q37, q39_hard_enemy)
		q39_hard_enemy.setTransition(trap, q40_item, q38, q39_hard_enemy)
		q40_item.setTransition(q39_hard_enemy, q40_item, q40_item, q41)
		q41.setTransition(q41, q41, q40_item, q42_hard_enemy)
		q42_hard_enemy.setTransition(q43_item, q42_hard_enemy, q41, q42_hard_enemy)
		q43_item.setTransition(q43_item, q42_hard_enemy, q43_item, q44)
		q44.setTransition(q45, q44, q43_item, q44)
		q45.setTransition(q28, q44, q45, q45)
		



	
	
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
