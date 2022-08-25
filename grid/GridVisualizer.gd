extends Node2D

const BACKGROUND_COLOR = Color.burlywood
const LINE_COLOR = Color(0, 0, 0, 0.2)
const LINE_WIDTH = 2
const RED_PLAYER_SENTRY_COLOR = Color(204, 0, 0, 0.1)
const BLUE_PLAYER_SENTRY_COLOR = Color( 0.254902, 0.411765, 0.882353, 0.2 )
onready var grid = $"%Grid"

func _ready():
	pass

func _draw():
	#var window_size = OS.get_window_size()
	draw_background()
	draw_player_sanctuary(Vector2(2, 0), RED_PLAYER_SENTRY_COLOR)
	draw_player_sanctuary(Vector2(2, 4), BLUE_PLAYER_SENTRY_COLOR)
	draw_columns()
	draw_rows()

func draw_background():
	var grid_size = grid.grid_size.x * grid.tile_size.x
	draw_rect(Rect2(grid.position, Vector2(grid_size, grid_size)), BACKGROUND_COLOR, true)
	
func draw_player_sanctuary(grid_position: Vector2, color: Color):
	var position = grid.map_to_world(grid_position)
	var size = grid.tile_size.x
	draw_rect(Rect2(position, Vector2(size, size)), color)

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
