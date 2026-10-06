extends TextureButton

signal option_pressed(label: String)

@export var popup_background: Texture2D
@export var popup_size: Vector2 = Vector2(160, 120)
@export var button_labels: Array[String] = ["Change theme", "Close"]
@export var button_font: Font
@export var button_font_size: int = 12

var _popup_layer: CanvasLayer = null
var _popup: Control = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_build_popup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	_popup.visible = not _popup.visible


func _build_popup() -> void:
	# CanvasLayer keeps the popup above everything and unaffected by Cap's transform
	_popup_layer = CanvasLayer.new()
	_popup_layer.layer = 10
	add_child(_popup_layer)

	_popup = Control.new()
	_popup.size = popup_size
	_popup.position = (get_viewport_rect().size - popup_size) / 2
	_popup.visible = false
	_popup_layer.add_child(_popup)

	var bg = TextureRect.new()
	bg.texture = popup_background
	bg.stretch_mode = TextureRect.STRETCH_SCALE
	bg.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	bg.set_anchors_preset(Control.PRESET_FULL_RECT)
	_popup.add_child(bg)

	var list = VBoxContainer.new()
	list.set_anchors_preset(Control.PRESET_FULL_RECT)
	list.alignment = BoxContainer.ALIGNMENT_CENTER
	_popup.add_child(list)

	for label in button_labels:
		var b = Button.new()
		b.text = label
		b.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		if button_font:
			b.add_theme_font_override("font", button_font)
		b.add_theme_font_size_override("font_size", button_font_size)
		b.pressed.connect(_on_popup_button_pressed.bind(label))
		list.add_child(b)


func _on_popup_button_pressed(label: String) -> void:
	match label:
		"Change theme":
			change_color("")
		"Close":
			_popup.visible = false
	option_pressed.emit(label)


func change_color(newcolorstring):

	newcolorstring = "#2a173b,#3f2c5f,#443f7b,#4c5c87,#69809e,#95c5ac"

	var newcolorlist = newcolorstring.replace("#","").replace(" ","").split(",")
	var names = ["newcolorone", "newcolortwo", "newcolorthree", "newcolorfour", "newcolorfive", "newcolorsix"]
	for i in range(6):

		var new_color = Color(newcolorlist[i])
		RenderingServer.global_shader_parameter_set(names[i], new_color)
