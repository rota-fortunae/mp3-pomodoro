extends Control

var dragging := false
var click_offset := Vector2i.ZERO

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				
				var mouse_pos = DisplayServer.mouse_get_position()
				var window_pos = DisplayServer.window_get_position()
				
				click_offset = mouse_pos - window_pos
			else:
				dragging = false

	elif event is InputEventMouseMotion and dragging:
		var mouse_pos = DisplayServer.mouse_get_position()
		var new_window_pos = mouse_pos - click_offset
		
		DisplayServer.window_set_position(new_window_pos)
