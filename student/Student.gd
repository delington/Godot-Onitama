extends Sprite


var game
var selected: bool = false
var color: Color
var coordinate: Vector2

func _init():
	game = Global.ref["Game"]

func _on_StudentArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if Global.is_any_pawn_selected:
			if !self.selected:	#this pawn is not the selected one but there is another one which is selected
				return
				
			Global.selected_pawn = null
			Global.is_any_pawn_selected = false
			game.manage_card_and_pawn_selection()
		else:
			Global.selected_pawn = self
			Global.is_any_pawn_selected = true
			game.manage_card_and_pawn_selection()
	Utils.handle_left_mouse_button_selection(event, self)
