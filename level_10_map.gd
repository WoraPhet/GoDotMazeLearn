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
	#Define State
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
	var q12 = node.new("q12")
	var q13 = node.new("q13")
	var q14 = node.new("q14")
	var q15_medium_enemy = node.new("q15_medium_enemy")
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
	var q28_item = node.new("q28_item")
	var q29 = node.new("q29")
	var q30 = node.new("q30")
	var q31 = node.new("q31")
	var q32 = node.new("q32")
	var q33_final = node.new("q33_final", true)
	var q34 = node.new("q34")
	var q35_enemy = node.new("q35_enemy")
	var q36 = node.new("q36")
	var q37_item = node.new("q37_item")
	var q38 = node.new("q38")
	var q39 = node.new("q39")
	var q40_item = node.new("q40_item")
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
	var q52_enemy = node.new("q52_enemy")
	var q53 = node.new("q53")
	var q54 = node.new("q54")
	var q55 = node.new("q55")
	var q56 = node.new("q56")
	var q57 = node.new("q57")
	var q58 = node.new("q58")
	var q59_item = node.new("q59_item")
	var q60 = node.new("q60")
	var q61 = node.new("q61")
	var q62 = node.new("q62")
	var q63 = node.new("q63")
	var q64 = node.new("q64")
	var q65_enemy = node.new("q65_enemy")
	var q66_item = node.new("q66_item")

	var trap = node.new("trap")

	
	func _init():
		# Set transitions for the nodes
		q0.setTransition(q0, q0, q0, q1)
		q1.setTransition(q2, q1, q0, q1)
		q2.setTransition(q3, q1, q2, q2)
		q3.setTransition(q4, q2, q3, q5)
		q4.setTransition(trap, q3, q4, q4)
		q5.setTransition(q5, q5, q3, q6)
		q6.setTransition(q34, q7, q5, trap)
		q7.setTransition(q6, q8, q7, q7)
		q8.setTransition(q7, q8, q8, q9)
		q9.setTransition(q9, q9, q8, q10)
		q10.setTransition(q42, q11, q9, trap)
		q11.setTransition(q10, q11, q11, q12)
		q12.setTransition(trap, q12, q11, q13)
		q13.setTransition(q14, q13, q12, trap)
		q14.setTransition(q15_medium_enemy, q13, trap, trap)
		q15_medium_enemy.setTransition(q15_medium_enemy, q14, trap, q16)
		q16.setTransition(q16, trap, q15_medium_enemy, q17)
		q17.setTransition(q17, q65_enemy, q16, q18)
		q18.setTransition(q19, q18, q17, trap)
		q19.setTransition(q20, q18, q19, trap)
		q20.setTransition(q64, q19, trap, q21)
		q21.setTransition(q21, trap, q20, q22)
		q22.setTransition(q22, trap, q21, q23)
		q23.setTransition(q23, q24, q22, q62)
		q24.setTransition(q23, q25, trap, trap)
		q25.setTransition(q24, trap, q26, trap)
		q26.setTransition(trap, q27, trap, q25)
		q27.setTransition(q26, q30, q28_item, trap)
		q28_item.setTransition(trap, q29, q28_item, q27)
		q29.setTransition(q28_item, q29, q29, q30)
		q30.setTransition(q27, q30, q29, q31)
		q31.setTransition(trap, q31, q30, q32)
		q32.setTransition(q32, q32, q31, q33_final)
		q33_final.setTransition(q33_final, q33_final, q32, q33_final)
		q34.setTransition(q35_enemy, q6, q34, q34)
		q35_enemy.setTransition(q43, q34, q35_enemy, q36)
		q36.setTransition(q36, q36, q35_enemy, q37_item)
		q37_item.setTransition(trap, q38, q36, q37_item)
		q38.setTransition(q37_item, q41, q38, q39)
		q39.setTransition(q39, trap, q38, q40_item)
		q40_item.setTransition(q40_item, q41, q0, q1)
		q41.setTransition(q38, q42, trap, trap)
		q42.setTransition(q41, q10, q42, trap)
		q43.setTransition(q44, q35_enemy, q43, q43)
		q44.setTransition(q44, q43, q44, q45)
		q45.setTransition(q45, q45, q44, q46)
		q46.setTransition(q46, trap, q45, q47)
		q47.setTransition(q47, q48, q46, trap)
		q48.setTransition(q47, q48, trap, q49)
		q49.setTransition(trap, q49, q48, q50)
		q50.setTransition(q50, q50, q49, q51)
		q51.setTransition(q52_enemy, q63, q50, trap)
		q52_enemy.setTransition(q52_enemy, q51, q52_enemy, q53)
		q53.setTransition(q53, trap, q52_enemy, q54)
		q54.setTransition(q54, q54, q53, q56)
		q55.setTransition(q55, q55, q54, q56)
		q56.setTransition(q56, q57, q55, trap)
		q57.setTransition(q56, q57, q58, q58)
		q58.setTransition(trap, q58, q57, q59_item)
		q59_item.setTransition(q59_item, q60, q58, q59_item)
		q60.setTransition(q59_item, q61, q60, q60)
		q61.setTransition(q60, q61, q62, q61)
		q62.setTransition(q62, trap, q23, q61)
		q63.setTransition(q51, trap, q63, q64)
		q64.setTransition(trap, q20, q63, q64)
		q65_enemy.setTransition(q17, q66_item, trap, q65_enemy)
		q66_item.setTransition(q65_enemy, q66_item, trap, q66_item)



	
	
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
