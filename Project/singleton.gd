
extends Node

var pokemon = [createPokemonData("Pikachu", "Electric"),createPokemonData("Charizard", "Fire"),createPokemonData("Squirtle", "Water"),createPokemonData("Meowth", "Normal")]

func createPokemonData(_Name, _Type):
	return {Name = _Name, Type = _Type}

func createCurrentPokemon(_Name, _Health, _XP, _Level):
	return {Name = _Name, Health = _Health, XP = _XP, Level = _Level }

func _ready():
	