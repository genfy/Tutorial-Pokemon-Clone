
extends Node

var pokemon = [createPokemonData("Pikachu", "Electric", 3),createPokemonData("Charizard", "Fire",4),createPokemonData("Squirtle", "Water",5),createPokemonData("Meowth", "Normal",8)]
var inventory = [createCreateInventoryItem("Ball", "res://icon.png", "A small ball", 0)]

func createPokemonData(_Name, _Type, _Tile):
	return {Name = _Name, Type = _Type, Tile = _Tile}

func createCurrentPokemon(_Name, _Health, _XP, _Level):
	return {Name = _Name, Health = _Health, XP = _XP, Level = _Level }

func createCreateInventoryItem(_Name, _Sprite, _Description, _ID):
	return {Name = _Name, ItemSprite = _Sprite, Description = _Description, ID = _ID }

func doesPlayerHaveItem(ID):
	for i in inventory:
		if i.ID == ID:
			return true
	return false;

func _ready():
	