
extends Patch9Frame

var menu = false
var open = false

var up = false
var down = false

var currentLabel = 0
var labels

var pointer

func _ready():
	set_process_unhandled_key_input(true)
	set_fixed_process(true)
	labels = get_node("Labels").get_children()
	pointer = get_node("Sprite")
	pointer_update()

func _fixed_process(delta):
	if open:
		
		if menu:
			set_hidden(true)
			get_tree().set_pause(false)
			open = false
		
		if up:
			if currentLabel == 0:
				currentLabel = labels.size()-1
			else:
				currentLabel-=1
			pointer_update()
		
		if down:
			if currentLabel == labels.size()-1:
				currentLabel = 0
			else:
				currentLabel+=1
			pointer_update()
		
		menu = false
		up = false
		down = false

func pointer_update():
	pointer.set_global_pos(Vector2(pointer.get_global_pos().x,labels[currentLabel].get_global_pos().y+4))

func _unhandled_key_input(key_event):
	if open:
		if key_event.is_action_pressed("ui_menu"):
			menu = true
		elif key_event.is_action_released("ui_menu"):
			menu = false
		if key_event.is_action_pressed("ui_down"):
			down = true
		elif key_event.is_action_released("ui_down"):
			down = false
		if key_event.is_action_pressed("ui_up"):
			up = true
		elif key_event.is_action_released("ui_up"):
			up = false

func _open_menu():
	set_hidden(false)
	get_tree().set_pause(true)
	menu = false
	open = true