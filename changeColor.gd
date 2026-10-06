extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	
	var newcolorstring = "#2a173b,#3f2c5f,#443f7b,#4c5c87,#69809e,#95c5ac"
	
	var newcolorlist = newcolorstring.replace("#","").replace(" ","").split(",")
	var names = ["newcolorone", "newcolortwo", "newcolorthree", "newcolorfour", "newcolorfive", "newcolorsix"]
	for i in range(6):
		
		var new_color = Color(newcolorlist[i])
		RenderingServer.global_shader_parameter_set(names[i], new_color)
