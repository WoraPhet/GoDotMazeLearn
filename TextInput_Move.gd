extends LineEdit
var regex = RegEx.new()
var oldtext = ""
func _ready():
	regex.compile("^[UuDdLlRr]*$")

func _on_text_changed(new_text):
	if regex.search(new_text):
		text = new_text
		oldtext = text
		set_caret_column(len(text))
	else:
		text = oldtext
		set_caret_column(len(text))
		
func get_value():
	return(int(text))

