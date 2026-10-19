extends Control
@onready var colorPickerWindow = $colorPicker
@onready var colorPicker :ColorPicker = $colorPicker/picker
@onready var chosenColorRect :String = "five"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_color_picker_color_changed(color: Color) -> void:
	RenderingServer.global_shader_parameter_set("newcolor"+chosenColorRect, color)


func _on_button_one_pressed() -> void:
	chosenColorRect = "six"
	colorPickerWindow.visible=true

func _on_button_two_pressed() -> void:
	chosenColorRect = "five"
	colorPickerWindow.visible=true


func _on_button_three_pressed() -> void:
	chosenColorRect = "four"
	colorPickerWindow.visible=true


func _on_button_four_pressed() -> void:
	chosenColorRect = "three"
	colorPickerWindow.visible=true


func _on_button_five_pressed() -> void:
	chosenColorRect = "two"
	colorPickerWindow.visible=true


func _on_button_six_pressed() -> void:
	chosenColorRect = "one"
	colorPickerWindow.visible=true


func _on_exit_color_picker_pressed() -> void:
	colorPickerWindow.visible=false
