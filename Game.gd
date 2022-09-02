class_name Game extends Node2D

onready var grid = $"%Grid"
onready var down_left_card = $"%Card1"
onready var Move = preload("res://move/Move.tscn")

var move_color = Global.MOVE_COLOR
var move_list = []

# Called when the node enters the scene tree for the first time.
func _init():
	Global.ref["Game"] = self
	
func _ready():
	down_left_card.moves = Global.cards[0].moves
	down_left_card.set_name(Global.cards[0].name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func handle_draw_of_moves():
	var is_card_selected = Global.is_selected(Global.selected_card)
	var is_pawn_selected = Global.is_selected(Global.selected_pawn)
	
	if is_card_selected && is_pawn_selected:
		var pawn_coordinate: Vector2 = grid.world_to_map(Global.selected_pawn.position)
		draw_possible_moves(pawn_coordinate, Global.selected_card)
		
	else:
		remove_moves_from_board()

func remove_moves_from_board():
	if move_list.empty():
		return
	
	for move in move_list:
		move.queue_free()
		
	move_list.clear()

func draw_possible_moves(pawn_base_coord: Vector2, card):
	for move in card.moves:
		var move_visual = Move.instance()
		move_list.append(move_visual)
		move_visual.modulate = move_color
		
		var move_coord = pawn_base_coord + move
		move_visual.position = grid.map_to_world(move_coord) + grid.half_tile_size
		
		add_child(move_visual)
