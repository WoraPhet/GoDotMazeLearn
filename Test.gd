extends Node2D

class node:
	var name
	var is_final_state = false
	var transition_inputU
	var transition_inputD
	var transition_inputL
	var transition_inputR
	
class myDFA_L1:
	
	var q0 = node.new()
	var q1 = node.new()
	var q2 = node.new()
	var q3 = node.new()
	var trap = node.new()
	func initState():
		q0.name = "q0"
		q1.name = "q1"
		q2.name = "q2"
		q3.name = "q3"
		trap.name = "trap"
		
		q3.is_final_state = true
		
		q0.transition_inputR = q1##
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
				presentState = presentState.transition_inputU
				print(presentState.name)
			elif(i == "R"):
				presentState = presentState.transition_inputR
				print(presentState.name)
			elif(i == "D"):
				presentState = presentState.transition_inputD
				print(presentState.name)
			elif(i == "L"):
				presentState = presentState.transition_inputL
				print(presentState.name)
		return presentState.is_final_state
# Called when the node enters the scene tree for the first time.
"""
func _ready():
	var obj = myDFA_L1.new()
	var is_complete = obj.determine("RLRDL")
	print(is_complete)
"""	
	
	
func _on_text_input_move_text_submitted(new_text):
	var inpToDFA = myDFA_L1.new()
	var is_complete = inpToDFA.determine(new_text)
	print(is_complete)

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


