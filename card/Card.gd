extends Sprite

onready var title = $"%Title"

var game
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
	Utils.handle_left_mouse_button_selection(event, self)
	
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.selected_card = self
		game.manage_card_and_pawn_selection()
