
extends Patch9Frame

var menu = false
var open = false

func _ready():
	set_process_unhandled_key_input(true)
	set_fixed_process(true)

func _fixed_process(delta):
	if open:
		
		if menu:
			set_hidden(true)
			get_tree().set_pause(false)
			open = false
		menu = false

func _unhandled_key_input(key_event):
	if open:
		if key_event.is_action_pressed("ui_menu"):
			menu = true
		elif key_event.is_action_released("ui_menu"):
			menu = false

func _open_menu():
	set_hidden(false)
	get_tree().set_pause(true)
	menu = false
	open = true