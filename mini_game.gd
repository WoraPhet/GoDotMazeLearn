extends Node2D
var active_enemy = null
var currCH:int = 1
@onready var timelabel = get_node("/root/TestGamMain/Easy1/pauseMenu/Fasttyping/Time")
@onready var timer = get_node("/root/TestGamMain/Easy1/pauseMenu/Fasttyping/Timer")
@onready var promt = get_node("/root/TestGamMain/Easy1/pauseMenu/Fasttyping/mainBG/Enemy")
@onready var timer_text = timelabel.text
var HP_zero = false
signal exitMonsterD1
signal hp_decrease_sig

func  _ready()->void:
	#promt.start()
	#timer.start()
	pass

func findNE(type_ch :String):
	#timer.start()
	var promt_text =promt.get_promt()
	print(promt_text)
	if promt_text.substr(0,1) == type_ch:
		active_enemy = promt
		print("new Enemy")
		active_enemy.set_next_chr(currCH)
		return

func _unhandled_input(event : InputEvent) -> void:

	if event is InputEventKey and not event.is_pressed():
		var type_event = event as InputEvent
		var key_type = PackedByteArray([type_event.keycode]).get_string_from_utf8()
		if active_enemy == null:
			findNE(key_type)
		else:
			var pp = active_enemy.get_promt()
			var next_chr = pp.substr(currCH,1)
			print(pp)
			if key_type == next_chr:
				print("success ",currCH)
				currCH +=1
				if currCH ==pp.length():
					print("clear")
					currCH-=1
					active_enemy.queue_free()
					active_enemy == null
					emit_signal("exitMonsterD1")
					#get_tree().change_scene_to_file("res://gametest.tscn")
				active_enemy.set_next_chr(currCH)
			else:
				print("wrong ", next_chr)
				HPdecress()
	
func _process(float)->void:
	var second = "%02d"%[int(timer.time_left) % 60]
	timelabel.parse_bbcode(set_tag_center(second))
	
func _on_timer_timeout():
	timer.stop()
	print("timeout")
	HPdecress()
	emit_signal("exitMonsterD1")
	#get_tree().change_scene_to_file("res://gametest.tscn")
	
func set_tag_center(centertag:String):
	return "[center]" + centertag +"[/center]"
	
func gameover():
	return

func HPdecress():
	Global.hp_global -= 10
	emit_signal("hp_decrease_sig")
	



func _on_easy_1_monster_1_pause():
	promt.start()
	timer.start()
