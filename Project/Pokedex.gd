
extends CanvasLayer

# member variables here, example:
# var a=2
# var b="textvar"
var pokedexHolder

var up = false
var down = false
var menu = false
var currentItem = 0

func _ready():
	var pokedexItem = load("res://PokedexItem.tscn")
	pokedexHolder = get_node("PokedexItems")
	var x = 300
	var y = 300
	for i in singleton.pokemon:
		var node = pokedexItem.instance()
		
		node.set_pos(Vector2(x,y))
		node.get_node("Label").set_text(i)
		pokedexHolder.add_child(node)
		y+=42+10
	
	set_process_unhandled_key_input(true)
	set_process(true)

func _unhandled_key_input(key_event):
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

func _process(delta):
	if down:
		pokedexHolder.set_pos(pokedexHolder.get_pos() + Vector2(0, 52))
		currentItem += 1
		if currentItem >= singleton.pokemon.size():
			currentItem = 0
	elif up:
		pokedexHolder.set_pos(pokedexHolder.get_pos() + Vector2(0, -52))
		currentItem -= 1
		if currentItem < 0:
			currentItem = singleton.pokemon.size() - 1
	if menu:
		get_node("/root/world/Player/Camera2D/Menu").open = true
		queue_free()
	up = false
	down = false
	menu = false