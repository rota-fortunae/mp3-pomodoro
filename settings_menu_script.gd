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

func change_color(newcolorstring):
	if newcolorstring == "":
		newcolorstring = "#2a173b,#3f2c5f,#443f7b,#4c5c87,#69809e,#95c5ac"

	var newcolorlist = newcolorstring.replace("#","").replace(" ","").split(",")
	var names = ["newcolorone", "newcolortwo", "newcolorthree", "newcolorfour", "newcolorfive", "newcolorsix"]
	for i in range(6):

		var new_color = Color(newcolorlist[i])
		RenderingServer.global_shader_parameter_set(names[i], new_color)

func _on_green_pressed() -> void:
	change_color("#0d0d0d,#003333,#0b6648,#439960,#89cc89,#eeffe6")

func _on_pink_pressed() -> void:
	change_color("#61567d,#826a95,#a57fad,#c495bf,#dcacc9,#f4c4d4")

func _on_red_pressed() -> void:
	change_color("#3a0000,#590000,#7c0300,#c02b18,#e04217,#f26d1f")
	
func _on_black_pressed() -> void:
	change_color("#5E5E5E, #767676, #8F8F8F, #A8A8A8,#BEBEBE,#D4D4D4")

func _on_yellow_pressed() -> void:
	change_color("#0e0705, #34140e, #653019, #ce812c, #e3ba66, #e7d99c")

func _on_blue_pressed() -> void:
	change_color("#2a173b,#3f2c5f,#443f7b,#4c5c87,#69809e,#95c5ac")
	
 
func _on_settings_button_pressed() -> void:
	settings.visible=true
	exit_button.visible=true
	green.visible=true
	pink.visible=true
	red.visible=true
	black.visible=true
	yellow.visible=true
	blue.visible=true
	$audioSlider.visible = true
	credits.visible=false
	credits_button.button_pressed = false
	

func _on_credits_button_pressed() -> void:
	settings.visible=false
	green.visible=false
	pink.visible=false
	red.visible=false
	black.visible=false
	yellow.visible=false
	blue.visible=false
	$audioSlider.visible = false
	
	credits.visible=true
	settings_button.button_pressed = false



func _on_exit_button_pressed() -> void:
	$"../../Charm/CharmSprite".visible = true
	$"../../Cap".visible = true 
	visible = false
	
	
