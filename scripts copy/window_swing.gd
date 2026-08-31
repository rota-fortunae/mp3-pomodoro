extends Node

@export var target_path: NodePath = NodePath("../Charm")
@export var strength: float = 30.0
@export var debug: bool = true

var _prev_window_pos: Vector2 = Vector2.ZERO
var _target: RigidBody2D = null

func _ready() -> void:
	if target_path != NodePath("") and has_node(target_path):
		var n = get_node(target_path)
		if n is RigidBody2D:
			_target = n
		elif debug:
			print("window_swing: target_path is not a RigidBody2D")
			
	if not _target:
		var parent = get_parent()
		if parent and parent is RigidBody2D:
			_target = parent
		else:
			var scene = get_tree().current_scene
			if scene:
				# Godot 4 replacement for find_node
				var found = scene.find_child("charm", true, false) 
				if found and found is RigidBody2D:
					_target = found

	_prev_window_pos = Vector2(DisplayServer.window_get_position())

	

func _physics_process(_delta: float) -> void:
	var current_win_pos := Vector2(DisplayServer.window_get_position())
	var dx: float = current_win_pos.x - _prev_window_pos.x

	#(current_win_pos)

	if _target and not is_zero_approx(dx):
		#print("Window moved! dx = ", dx)
		var impulse := Vector2(-dx * strength, 0)
		_target.apply_impulse(impulse)
		
	_prev_window_pos = current_win_pos
