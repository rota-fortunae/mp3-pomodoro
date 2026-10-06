@tool 
extends EditorScript

func _ready() -> void:
	var new_color = Color.CORNFLOWER_BLUE
	RenderingServer.global_shader_parameter_set("newcolorone", new_color)
