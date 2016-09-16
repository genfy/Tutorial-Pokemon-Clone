
extends Node

var pokemon = ["1","2","3","4"]

func createCurrentPokemon(_Name, _Health, _XP, _Level):
	return {Name = _Name, Health = _Health, XP = _XP, Level = _Level }

func _ready():
	