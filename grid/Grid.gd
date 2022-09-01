class_name Grid extends TileMap

const PLAYER_COLOR = Global.PLAYER_COLOR
const ENEMY_COLOR = Global.ENEMY_COLOR
const PLAYER_STARTING_ROW = 0
const ENEMY_STARTING_ROW = 4

enum {EMPTY, STUDENT, MASTER, ENEMY_STUDENT, ENEMY_MASTER}

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

var grid_size = Vector2(5, 5)
var grid = []

onready var GridLinesTile = preload("res://grid/Grid.tscn")
onready var Master = preload("res://master/Master.tscn")
onready var Student = preload("res://student/Student.tscn")

func _ready():
	# 1. Create the grid Array
	for x in range(grid_size.x):
		grid.append([])
		
		for y in range(grid_size.y):
			grid[x].append(EMPTY)

	place_player_pawns(0, ENEMY_STUDENT, ENEMY_MASTER, ENEMY_COLOR)
	place_player_pawns(4, STUDENT, MASTER, PLAYER_COLOR)

func place_player_pawns(row_index, student_type, master_type, color):
	for i in 5:
		var start_position = Vector2(i, row_index)
		
		#in the center there is a Master pawn
		if (i == 2):
			var master_pawn = Master.instance()
			place_pawn(master_pawn, start_position, student_type, color)
		else:
			var student = Student.instance()
			place_pawn(student, start_position, master_type, color)
		
func place_pawn(pawn, start_position, type, color):
	pawn.coordinate = start_position
	pawn.position = map_to_world(start_position) + half_tile_size
	pawn.set_modulate(color)
	pawn.color = color
	
	grid[start_position.x][start_position.y] = type
	add_child(pawn)

func draw_square(position: Vector2):
	pass
