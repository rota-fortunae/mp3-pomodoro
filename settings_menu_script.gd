extends Control

@onready var background: TextureRect = $background
@onready var settings: TextureRect = $settings
@onready var credits_button: TextureButton = $creditsButton
@onready var settings_button: TextureButton = $settingsButton
@onready var exit_button: TextureButton = $exitButton
@onready var green: Button = $green
@onready var pink: Button = $pink
@onready var red: Button = $red
@onready var black: Button = $black
@onready var yellow: Button = $yellow
@onready var blue: Button = $blue
@onready var audio_slider: HSlider = $audioSlider
@onready var credits: TextureRect = $credits



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background.visible=true
	settings.visible=true
	credits_button.visible=true
	settings_button.visible=true
	exit_button.visible=true
	
	credits.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_green_pressed() -> void:
	pass # Replace with function body.


func _on_pink_pressed() -> void:
	pass # Replace with function body.


func _on_red_pressed() -> void:
	pass # Replace with function body.


func _on_black_pressed() -> void:
	pass # Replace with function body.


func _on_yellow_pressed() -> void:
	pass # Replace with function body.


func _on_blue_pressed() -> void:
	change_color("")
	
func change_color(newcolorstring):
	if newcolorstring == "":
		newcolorstring = "#2a173b,#3f2c5f,#443f7b,#4c5c87,#69809e,#95c5ac"

	var newcolorlist = newcolorstring.replace("#","").replace(" ","").split(",")
	var names = ["newcolorone", "newcolortwo", "newcolorthree", "newcolorfour", "newcolorfive", "newcolorsix"]
	for i in range(6):

		var new_color = Color(newcolorlist[i])
		RenderingServer.global_shader_parameter_set(names[i], new_color)


func _on_settings_button_pressed() -> void:
	change_color("")
	
