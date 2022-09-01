extends Sprite


var game
var selected: bool = false
var color: Color
var coordinate: Vector2

func _init():
	game = Global.ref["Game"]

func _on_StudentArea_input_event(viewport, event, shape_idx):
	Utils.handle_left_mouse_button_selection(event, self)
	
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		Global.selected_pawn = self
		game.manage_card_and_pawn_selection()
