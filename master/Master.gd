extends Sprite


var selected: bool = false
var color: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_MasterArea_input_event(viewport, event, shape_idx):
	Utils.handle_left_mouse_button_selection(event, self)
