
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
	pokedexHolder = get_node("InventoryItems")
	var x = 0
	var y = 0
	
	get_node("Name").set_text(singleton.inventory[0].Name)
	get_node("Description").set_text(singleton.inventory[0].Description)
	
	for i in singleton.inventory:
		var node = pokedexItem.instance()
		
		node.set_pos(Vector2(x,y))
		node.get_node("Label").set_text(i.Name)
		pokedexHolder.add_child(node)
		y+=42+10
	
	get_node("Name").set_text(singleton.inventory[currentItem].Name)
	get_node("Description").set_text(singleton.inventory[currentItem].Description)
	get_node("ItemImage").set_texture(load(singleton.inventory[currentItem].ItemSprite));
	
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
	if up and currentItem < singleton.inventory.size() - 1:
		pokedexHolder.set_pos(pokedexHolder.get_pos() + Vector2(0, -52))
		currentItem += 1
		get_node("Name").set_text(singleton.inventory[currentItem].Name)
		get_node("Description").set_text(singleton.inventory[currentItem].Description)
		get_node("ItemImage").set_texture(load(singleton.inventory[currentItem].ItemSprite));
	elif down and currentItem > 0:
		pokedexHolder.set_pos(pokedexHolder.get_pos() + Vector2(0, 52))
		currentItem -= 1
		get_node("Name").set_text(singleton.inventory[currentItem].Name)
		get_node("Description").set_text(singleton.inventory[currentItem].Description)
		get_node("ItemImage").set_texture(load(singleton.inventory[currentItem].ItemSprite));
	if menu:
		get_node("/root/world/Player/Camera2D/Menu").open = true
		queue_free()
	up = false
	down = false
	menu = false