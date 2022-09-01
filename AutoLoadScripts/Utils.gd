extends Node2D

var selection_color = Global.SELECTION_COLOR

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_unselected(sprite: Sprite):
	sprite.selected = false
	sprite.set_modulate(sprite.color)
	
func set_selected(sprite: Sprite):
	sprite.selected = true
	sprite.set_modulate(selection_color)
	sprite.modulate.a = 2

func handle_left_mouse_button_selection(event, sprite: Sprite):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if (sprite.selected):
			set_unselected(sprite)
		else:
			set_selected(sprite)

