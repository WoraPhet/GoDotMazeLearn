extends Node2D
func _ready():
	TimeTriggerSig.emit_signal("start_timer","show")
	Global.current_map_for_file = 9

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
	var q5 = node.new("q5")
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
	var q18_enemy = node.new("q18_enemy")
	var q19 = node.new("q19")
	var q20 = node.new("q20")
	var q21 = node.new("q21")
	var q22 = node.new("q22")
	var q23 = node.new("q23")
	var q24_item = node.new("q24_item")
	var q25 = node.new("q25")
	var q26 = node.new("q26")
	var q27 = node.new("q27")
	var q28 = node.new("q28")
	var q29 = node.new("q29")
	var q30 = node.new("q30")
	var q31 = node.new("q31")
	var q32 = node.new("q32")
	var q33_item = node.new("q33_item")
	var q34 = node.new("q34")
	var q35 = node.new("q35")
	var q36 = node.new("q36")
	var q37 = node.new("q37")
	var q38_enemy = node.new("q38_enemy")
	var q39 = node.new("q39")
	var q40 = node.new("q40")
	var q41 = node.new("q41")
	var q42 = node.new("q42")
	var q43 = node.new("q43")
	var q44 = node.new("q44")
	var q45 = node.new("q45")
	var q46 = node.new("q46")
	var q47 = node.new("q47")
	var q48 = node.new("q48")
	var q49 = node.new("q49")
	var q50 = node.new("q50")
	var q51 = node.new("q51")
	var q52 = node.new("q52")
	var q53 = node.new("q53")
	var q54 = node.new("q54")
	var q55 = node.new("q55")
	var q56 = node.new("q56")
	var q57 = node.new("q57")
	var q58_final = node.new("q58_final", true)
	
	var trap = node.new("trap")
	
	func _init():
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q2, q1, q0, q8)
		q2.setTransition(q3, q1, q2, q2)
		q3.setTransition(q4, q2, q3, q3)
		q4.setTransition(q4, q3, q4, q5)
		q5.setTransition(q6_item, q5, q4, trap)
		q6_item.setTransition(trap, q5, q6_item, q7)
		q7.setTransition(q7, trap, q6_item, q7)
		q8.setTransition(q8, q9, q1, q12)
		q9.setTransition(q8, q10, q9, q9)
		q10.setTransition(q9, q10, q10, q11)
		q11.setTransition(q11, q11, q10, trap)
		q12.setTransition(q13, q12, q8, q19)
		q13.setTransition(q14, q12, q13, q13)
		q14.setTransition(trap, q13, q14, q15)
		q15.setTransition(q16, q15, q14, q15)
		q16.setTransition(q16, q15, trap, q17)
		q17.setTransition(q17, q17, q16, q18_enemy)
		q18_enemy.setTransition(q30, q29, q17, trap)
		q19.setTransition(q19, q19, q12, q20)
		q20.setTransition(q20, q23, q19, q21)
		q21.setTransition(q28, q21, q20, q22)
		q22.setTransition(q22, q22, q21, trap)
		q23.setTransition(q20, q24_item, q23, q23)
		q24_item.setTransition(q23, q24_item, trap, q25)
		q25.setTransition(q25, q25, q24_item, q26)
		q26.setTransition(q26, q26, q25, q27)
		q27.setTransition(q27, q27, q26, q35)
		q28.setTransition(q29, q21, q28, q28)
		q29.setTransition(q18_enemy, q28, q29, q29)
		q30.setTransition(q30, q18_enemy, q30, q31)
		q31.setTransition(q31, trap, q30, q32)
		q32.setTransition(q32, q33_item, q31, trap)
		q33_item.setTransition(q32, trap, trap, q34)
		q34.setTransition(trap, q39, q33_item, q40)
		q35.setTransition(q36, q35, q27, trap)
		q36.setTransition(q37, q35, q36, q36)
		q37.setTransition(q38_enemy, q36, trap, q50)
		q38_enemy.setTransition(q39, q37, q38_enemy, q38_enemy)
		q39.setTransition(q34, q38_enemy, trap, q39)
		q40.setTransition(q41, q40, q34, q40)
		q41.setTransition(q42, q40, trap, q41)
		q42.setTransition(q42, q41, q42, q43)
		q43.setTransition(q43, q43, q42, q44)
		q44.setTransition(q44, q45, q43, q44)
		q45.setTransition(q44, q46, q45, q45)
		q46.setTransition(q45, q47, q46, q48)
		q47.setTransition(q46, trap, q47, q47)
		q48.setTransition(q48, q48, q46, q49)
		q49.setTransition(q49, q40, q48, trap)
		q50.setTransition(q50, q50, q37, q51)
		q51.setTransition(q51, q52, q50, trap)
		q52.setTransition(q51, q52, q52, q53)
		q53.setTransition(trap, q53, q52, q54)
		q54.setTransition(q55, q54, q53, trap)
		q55.setTransition(q56, q54, trap, q55)
		q56.setTransition(q56, q55, trap, q57)
		q57.setTransition(q57, q57, q56, q58_final)
		q58_final.setTransition(q58_final, q58_final, q57, q58_final)




	
	
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
