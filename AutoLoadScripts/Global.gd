extends Node2D


const PLAYER_COLOR = Color.firebrick
const ENEMY_COLOR = Color.royalblue
const SELECTION_COLOR = Color.yellowgreen
const BACKGROUND_COLOR = Color.burlywood
const MOVE_COLOR = Color(1, 1, 0, 0.2)

const cards = [
	{
		"name": "Boar",
		"moves": [Vector2(-1, 0), Vector2(0, -1), Vector2(1, 0)],
		"color": Color.darkgreen
	}
]

var ref: Dictionary

var selected_card = null
var selected_pawn = null
var is_any_pawn_selected = false

func is_selected(selected_object) -> bool:
	if selected_object != null:
		return selected_object.selected
	
	return false
