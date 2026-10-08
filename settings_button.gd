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
	_popup.visible = true
	$"../Cap".visible = false
	$"../Charm/CharmSprite".visible = false


func _build_popup() -> void:
	_popup = $SettingsMenu
	_popup.visible = false
