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
	var q5 = node.new("q5")
	var q6 = node.new("q6")
	var q7 = node.new("q7")
	var q8 = node.new("q8")
	var q9_enemy = node.new("q9_enemy")
	var q10_item = node.new("q10_item")
	var q11 = node.new("q11")
	var q12 = node.new("q12")
	var q13 = node.new("q13")
	var q14 = node.new("q14")
	var q15 = node.new("q15")
	var q16 = node.new("q16")
	var q17 = node.new("q17")
	var q18 = node.new("q18")
	var q19_secretend = node.new("q19_secretend",true)
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
	var q31_item = node.new("q31_item")
	var q32 = node.new("q32")
	var q33 = node.new("q33")
	var q34 = node.new("q34")
	var q35 = node.new("q35")
	var q36 = node.new("q36")
	var q37 = node.new("q37")
	var q38 = node.new("q38")
	var q39 = node.new("q39")
	var q40_item = node.new("q40_item")
	var q41 = node.new("q41")
	var q42 = node.new("q42")
	var q43 = node.new("q43")
	var q44_enemy = node.new("q44_enemy")
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
		#Set transitions for the node.news
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q2,q1,q0,q1)
		q2.setTransition(q3, q1, q2, q2)
		q3.setTransition(q4, q2, q3, q3)
		q4.setTransition(q20, q3, q4, q5)
		q5.setTransition(q5, q5, q4, q6)
		q6.setTransition(q6, q7, q5, trap)
		q7.setTransition(q6, q8, q7, q7)
		q8.setTransition(q7, q9_enemy, q8, q8)
		q9_enemy.setTransition(q8, q10_item, q9_enemy, q11)
		q10_item.setTransition(q9_enemy, trap, q10_item, q10_item)
		q11.setTransition(q11, q11, q9_enemy, q12)
		q12.setTransition(q13, q12, q11, q12)
		q13.setTransition(q13, q12, q13, q14)
		q14.setTransition(q14, q14, q13, q15)
		q15.setTransition(q15, q16, q14, q15)
		q16.setTransition(q15, q17, q16, q16)
		q17.setTransition(q16, q17, q18, q17)
		q18.setTransition(q18, q19_secretend, q18, q17)
		q19_secretend.setTransition(q18, q19_secretend, q19_secretend, q19_secretend)
		q20.setTransition(q21, q4, q20, q20)
		q21.setTransition(q21, q29, q21, q22)
		q22.setTransition(q22, q22, q21, q23)
		q23.setTransition(q23, q23, q22, q24)
		q24.setTransition(q24, q24, q23, q25)
		q25.setTransition(q25, q25, q24, q26)
		q26.setTransition(q26, q26, q25, q27)
		q27.setTransition(q27, q28, q26, trap)
		q28.setTransition(q27, q29, q28, q32)
		q29.setTransition(q28, q29, q30, q29)
		q30.setTransition(q30, q30, q31_item, q20)
		q31_item.setTransition(q31_item, q31_item, trap, q30)
		q32.setTransition(trap, q32, q28, q33)
		q33.setTransition(q33, q41, q32, q34)
		q34.setTransition(q35, q34, q33, q34)
		q35.setTransition(q35, q34, q35, q36)
		q36.setTransition(q36, q36, q35, q37)
		q37.setTransition(q37, q38, q36, trap)
		q38.setTransition(q37, q39, q38, q38)
		q39.setTransition(q38, q39, q39, q40_item)
		q40_item.setTransition(q40_item, q40_item, q39, trap)
		q41.setTransition(q33, q42, q41, q41)
		q42.setTransition(q41, q43, q42, q42)
		q43.setTransition(q42, q43, q43, q44_enemy)
		q44_enemy.setTransition(q44_enemy, q45, q43, trap)
		q45.setTransition(q44_enemy, trap, q45, q46)
		q46.setTransition(trap, q47, q45, trap)
		q47.setTransition(q46, trap, trap, q48)
		q48.setTransition(trap, q49, q47, trap)
		q49.setTransition(q48, q49, trap, q50)
		q50.setTransition(trap, q50, q49, q51)
		q51.setTransition(q52, q51, q50, q51)
		q52.setTransition(q53, q51, trap, q52)
		q53.setTransition(q54, q52, q53, q53)
		q54.setTransition(q56, q53, q55, q54)
		q55.setTransition(q55, q55, q55, q54)
		q56.setTransition(trap, q54, q56, q57)
		q57.setTransition(q58_final, q57, q56, q57)
		q58_final.setTransition(q58_final, q57, trap, q58_final)


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
