extends Node2D

const BACKGROUND_COLOR = Color.burlywood
const LINE_COLOR = Color(0, 0, 0, 0.2)
const LINE_WIDTH = 2

onready var grid = $"%Grid"

func _ready():
	#modulate = Color.burlywood
	pass

func _draw():
	#var window_size = OS.get_window_size()
	draw_background()
	draw_columns()
	draw_rows()

func draw_background():
	var grid_size = grid.grid_size.x * grid.tile_size.x
	draw_rect(Rect2(grid.position, Vector2(grid_size, grid_size)), BACKGROUND_COLOR, true)

func draw_columns():
	for x in range(grid.grid_size.x + 1):
		var column_position = x * grid.tile_size.x
		var limit = grid.grid_size.y * grid.tile_size.y
		draw_line(Vector2(column_position, 0), Vector2(column_position, limit), LINE_COLOR, LINE_WIDTH)
		
func draw_rows():
	for y in range(grid.grid_size.y + 1):
		var row_position = y * grid.tile_size.y
		var limit = grid.grid_size.x * grid.tile_size.x
		draw_line(Vector2(0, row_position), Vector2(limit, row_position), LINE_COLOR, LINE_WIDTH)
