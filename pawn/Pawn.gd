extends Sprite


var game: Game
var selected: bool = false
var color: Color
var coordinate: Vector2


func _init():
	game = Global.ref["Game"]

func _on_Area_input_event(viewport, event, shape_idx) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if Global.is_any_pawn_selected:
			if !self.selected:	#this pawn is not the selected one but there is another one which is selected
				return

			Global.selected_pawn = null
			Global.is_any_pawn_selected = false
		else:
			Global.selected_pawn = self
			Global.is_any_pawn_selected = true

		Utils.handle_left_mouse_button_selection(event, self)
		game.handle_draw_of_moves()
