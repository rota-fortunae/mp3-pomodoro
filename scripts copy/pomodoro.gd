extends Node

@export var work_minutes: int = 50
@export var break_minutes: int = 10
@export var debug: bool = true

var _is_running: bool = false
var _is_work: bool = true
var _remaining_time: float = float(work_minutes * 60)

var _clock_label: Label = null
var _break_indicator: AnimatedSprite2D = null
var _button: TextureButton = null

func _ready() -> void:
	var p = get_parent()
	if p:
		if p.has_node("Clock"):
			_clock_label = p.get_node("Clock")
		else:
			if debug: print("Pomodoro: Clock label not found")
		if p.has_node("BreakIndicator"):
			_break_indicator = p.get_node("BreakIndicator")
		else:
			if debug: print("Pomodoro: BreakIndicator not found")
		if p.has_node("TextureButton"):
			_button = p.get_node("TextureButton")
			_button.connect("pressed", Callable(self, "_on_pomo_button_pressed"))
		else:
			if debug: print("Pomodoro: TextureButton not found")
	else:
		if debug: print("Pomodoro: parent not found")

	# enable processing so _process() runs
	set_process(true)

	_update_pomodoro_labels()

func _on_pomo_button_pressed() -> void:
	_is_running = not _is_running
	if debug:
		print("Pomodoro: running=", _is_running)

func _process(delta: float) -> void:
	if _is_running:
		_remaining_time -= delta
		if _remaining_time <= 0:
			_is_work = not _is_work
			_remaining_time = float((work_minutes if _is_work else break_minutes) * 60)
			_update_pomodoro_labels()
		_update_clock()

func _update_clock() -> void:
	if _clock_label:
		var secs = int(max(_remaining_time, 0))
		var m = int(secs / 60)
		var s = secs % 60
		_clock_label.text = str(m) + ":" + ("%02d" % s)

func _update_pomodoro_labels() -> void:
	# set animated indicator to either 'work' or 'break' (expects animations named accordingly)
	if _break_indicator:
		_break_indicator.animation = ("work" if _is_work else "break")
		_break_indicator.play()
	_remaining_time = float((work_minutes if _is_work else break_minutes) * 60)
	_update_clock()
