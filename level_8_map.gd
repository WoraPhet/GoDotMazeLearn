extends Node2D
signal monster1Pause
func _ready():
	TimeTriggerSig.emit_signal("start_timer","show")
	Global.current_map_for_file = 8

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
	var q3 = node.new("q3")
	var q4 = node.new("q4")
	var q5_enemy = node.new("q5_enemy")
	var q6_item = node.new("q6_item")
	var q7 = node.new("q7")
	var q8 = node.new("q8")
	var q9 = node.new("q9")
	var q10 = node.new("q10")
	var q11 = node.new("q11")
	var q12 = node.new("q12")
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
	var q23_item = node.new("q23_item")
	var q24 = node.new("q24")
	var q25 = node.new("q25")
	var q26_enemy = node.new("q26_enemy")
	var q27 = node.new("q27")
	var q28 = node.new("q28")
	var q29 = node.new("q29")
	var q30 = node.new("q30")
	var q31 = node.new("q31")
	var q32 = node.new("q32")
	var q33 = node.new("q33")
	var q34 = node.new("q34")
	var q35 = node.new("q35")
	var q36 = node.new("q36")
	var q37 = node.new("q37")
	var q38 = node.new("q38")
	var q39 = node.new("q39")
	var q40_final = node.new("q40_final", true)

	var trap = node.new("trap")

	
	func _init():
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q1, q1, q0, q2)
		q2.setTransition(q3, q9, q1, q2)
		q3.setTransition(q4, q2, q3, q3)
		q4.setTransition(q4, q3, q4, q5_enemy)#
		q5_enemy.setTransition(q5_enemy, q5_enemy, q4, q6_item)
		q6_item.setTransition(q6_item, q7, q5_enemy, trap)
		q7.setTransition(q6_item, trap, q7, q8)
		q8.setTransition(trap, q8, q7, q8)
		q9.setTransition(q2, q10, q9, q9)
		q10.setTransition(q9, q10, q10, q11)
		q11.setTransition(q11, q11, q10, q12)
		q12.setTransition(q13, q12, q11, trap)
		q13.setTransition(trap, q12, q13, q14)
		q14.setTransition(q14, trap, q13, q15)
		q15.setTransition(q15, q16, q14, trap)
		q16.setTransition(q15, q16, trap, q17)
		q17.setTransition(trap, q17, q16, q18)
		q18.setTransition(q19, q18, q17, trap)
		q19.setTransition(q20, q18, trap, q19)
		q20.setTransition(q21, q19, q20, q20)
		q21.setTransition(q29, q20, q21, q22)
		q22.setTransition(q22, q22, q21, q23_item)
		q23_item.setTransition(q23_item, q24, q22, trap)
		q24.setTransition(q23_item, q25, q24, q24)
		q25.setTransition(q24, q25, q25, q26_enemy)
		q26_enemy.setTransition(q26_enemy, q26_enemy, q25, q27)
		q27.setTransition(trap, q27, q26_enemy, q28)
		q28.setTransition(q28, q28, q27, q28)
		q29.setTransition(q30, q21, q29, q29)
		q30.setTransition(q30, q29, q30, q31)
		q31.setTransition(q31, q31, q30, q32)
		q32.setTransition(q32, q32, q31, q33)
		q33.setTransition(q33, q33, q32, q34)
		q34.setTransition(q34, q35, q33, trap)
		q35.setTransition(q34, q36, q35, q35)
		q36.setTransition(q35, trap, trap, q37)
		q37.setTransition(q37, q37, q36, q38)
		q38.setTransition(q38, q39, q37, trap)
		q39.setTransition(q38, q39, q39, q40_final)
		q40_final.setTransition(trap, q40_final, q39, q40_final)



	
	
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

