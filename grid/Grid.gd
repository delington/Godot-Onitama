extends TileMap

enum {EMPTY, PLAYER, ENEMY_PLAYER}

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

var grid_size = Vector2(5, 5)
var grid = []

onready var GridLinesTile = preload("res://grid/Grid.tscn")

func _ready():
	# 1. Create the grid Array
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):

			grid[x].append(EMPTY)

	# 2. Create obstacles


func is_cell_vacant():
	# Return true if the cell is vacant, else false
	pass


func update_child_pos(child, new_pos, direction):
	# Move a child to a new position in the grid Array
	# Returns the new target world position of the child
	pass
