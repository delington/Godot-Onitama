extends Sprite

onready var title = $"%Title"

var game: Game
var selected: bool = false
var color: Color = Color.white
var card_name: String
var moves

func _init():
	game = Global.ref["Game"]
	
func _ready():
	pass
	
func set_name(name: String):
	card_name = name
	title.text = name

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Utils.handle_left_mouse_button_selection(event, self)

		Global.selected_card = self
		game.handle_draw_of_moves()
