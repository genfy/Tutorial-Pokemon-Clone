extends Area2D



func _on_Tall_Grass_body_enter( body ):
	get_parent().get_node("Player").inGrass = true


func _on_Tall_Grass_body_exit( body ):
	get_parent().get_node("Player").inGrass = false
