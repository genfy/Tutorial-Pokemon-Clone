
extends Area2D

export var sceneToMove = ""

func _on_Area2D_body_enter( body ):
	get_tree().get_root().get_node("world").queue_free()
	get_tree().get_root().add_child(load(sceneToMove).instance())
