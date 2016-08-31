
extends Patch9Frame

var printing = false
var donePrinting = false

var pressed = false

var timer = 0
var textToPrint = []

var currentChar = 0
var currentText = 0

const SPEED = 0.01

func _ready():
	set_fixed_process(true)
	set_process_unhandled_key_input(true)

func _unhandled_key_input(key_event):
	if key_event.is_action_pressed("ui_interact"):
		pressed = true
	elif key_event.is_action_released("ui_interact"):
		pressed = false

func _fixed_process(delta):
	if printing:
		if !donePrinting:
			timer += delta
			if timer > SPEED:
				timer = 0
				get_node("RichTextLabel").set_bbcode(get_node("RichTextLabel").get_bbcode() + textToPrint[currentText][currentChar])
				currentChar += 1
			
			if currentChar >= textToPrint[currentText].length():
				currentChar = 0
				timer = 0
				donePrinting = true
				currentText += 1
		elif pressed:
			donePrinting = false
			get_node("RichTextLabel").set_bbcode("")
			if currentText >= textToPrint.size():
				currentText = 0
				textToPrint = []
				printing = false
				set_hidden(true)
				get_node("/root/world/Player").canMove = true
	
	pressed = false


func _print_dialogue(text):
	textToPrint = text
	printing = true
	get_node("/root/world/Player").canMove = false
