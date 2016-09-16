
extends CanvasLayer

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	var pokedexItem = load("res://PokedexItem.tscn")
	var pokedexHolder = get_node("PokedexItems")
	var x = 300
	var y = 300
	for i in singleton.pokemon:
		var node = pokedexItem.instance()
		node.set_pos(Vector2(x,y))
		node.get_node("Label").set_text(i)
		pokedexHolder.add_child(node)
		x+=10
		y+=10