extends Node2D

signal resetTimer
func _ready():
	#emit_signal("resetTimer")
	TimeTriggerSig.emit_signal("start_timer","un_use")

