extends Sprite


var selected: bool = false
var color: Color
var selection_color = Global.SELECTION_COLOR

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_unselected():
	self.selected = false
	self.set_modulate(self.color)
	
func set_selected():
	self.selected = true
	self.set_modulate(selection_color)
	self.modulate.a = 5

func _on_StudentArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if (selected):
			set_unselected()
		else:
			set_selected()
