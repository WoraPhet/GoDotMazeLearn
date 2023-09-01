extends Node2D


signal approve_dfa(approve_text)
var queue = []

func _ready():
	#emit_signal("approve_dfa","From Readyyyyyyyyyyyyyyyyy")
	pass

class node:
	var name
	var is_final_state = false
	var transition_inputU
	var transition_inputD
	var transition_inputL
	var transition_inputR
	
class myDFA_L1:
	signal approve_dfa(approve_text)
	var q0 = node.new()
	var q1 = node.new()
	var q2 = node.new()
	var q3 = node.new()
	var trap = node.new()
	var sendR = node.new()
	
	func initState():
		q0.name = "q0"
		q1.name = "q1"
		q2.name = "q2"
		q3.name = "q3"
		trap.name = "trap"
		sendR.name = "R"
		
		q3.is_final_state = true
		
		q0.transition_inputR = q1
		q0.transition_inputD = q0
		q0.transition_inputL = q0
		q0.transition_inputU = q0
		
		q1.transition_inputR = q1
		q1.transition_inputD = q2##
		q1.transition_inputL = q0
		q1.transition_inputU = q1
		
		q2.transition_inputR = q2
		q2.transition_inputD = trap
		q2.transition_inputL = q3##
		q2.transition_inputU = q2
		
		q3.transition_inputR = trap
		q3.transition_inputD = trap
		q3.transition_inputL = trap
		q3.transition_inputU = trap
	func determine(input: String):
		initState()
		var presentState = node.new()
		presentState = q0
		print(presentState.name)
		for i in input:
			if(i == "U"):
				if (presentState.name != presentState.transition_inputU.name):
					presentState = presentState.transition_inputU
					DfaSig.emit_signal("DFA_check","Test TextUUUUUUUU")
					#print("turn UP")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
			elif(i == "R"):
				if (presentState.name != presentState.transition_inputR.name):
					presentState = presentState.transition_inputR
					DfaSig.emit_signal("DFA_check","Test TextRRRRRRRR")
					#print("turn Right")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
					
			elif(i == "D"):
				if (presentState.name != presentState.transition_inputD.name):
					presentState = presentState.transition_inputD
					DfaSig.emit_signal("DFA_check","Test TextDDDDDDDD")
					#print("turn Down")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
			elif(i == "L"):
				if (presentState.name != presentState.transition_inputL.name):
					presentState = presentState.transition_inputL
					DfaSig.emit_signal("DFA_check","Test TextLLLLLLLL")
					#print("turn Left")
					print(presentState.name)
				else:
					print("StayStill")
					print(presentState.name)
		return presentState.is_final_state
# Called when the node enters the scene tree for the first time.	
	
	
func _on_text_input_move_text_submitted(new_text):
	var inpToDFA = myDFA_L1.new()
	var is_complete = inpToDFA.determine(new_text.to_upper())
	print(is_complete)

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


