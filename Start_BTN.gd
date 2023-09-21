extends Button

func _pressed():
	get_tree().change_scene_to_file("res://level_1.tscn") #Levelแรก

func _ready():
	TimeTriggerSig.emit_signal("start_timer","hide")
