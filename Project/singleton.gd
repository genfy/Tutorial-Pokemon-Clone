
extends Node

var pokemon = [createPokemonData("Pikachu", "Electric", 3),createPokemonData("Charizard", "Fire",4),createPokemonData("Squirtle", "Water",5),createPokemonData("Meowth", "Normal",8)]

func createPokemonData(_Name, _Type, _Tile):
	return {Name = _Name, Type = _Type, Tile = _Tile}

func createCurrentPokemon(_Name, _Health, _XP, _Level):
	return {Name = _Name, Health = _Health, XP = _XP, Level = _Level }

func _ready():
	