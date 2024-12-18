extends Node3D

@export_category("Configurables")
@export var cam_v_max : float = 110.0
@export var cam_v_min : float = -75.0
@export var h_sensitivity : float = 0.1
@export var v_sensitivity : float = 0.1
@export var h_acceleration : float = 15.0
@export var v_acceleration : float = 15.0
@export var smooth_camera_tolerance : float = .3

var camrot_h : float = 0.0
var camrot_v : float = 0.0
var level_finished = false;

@onready var marble = $"../Marble"
@onready var h_rotation = $HRotation
@onready var v_rotation = $HRotation/VRotation

# Called when the node enters the scene tree for the first time.
func _ready():
	#hide mouse at start
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.
	
func _physics_process(delta):
	global_position = lerp(global_position, marble.get_node("MeshInstance3D").global_position,smooth_camera_tolerance)
	
	camrot_v = clamp(camrot_v, cam_v_min, cam_v_max)

	if level_finished:
		h_rotation.rotation_degrees.y = lerp(h_rotation.rotation_degrees.y, h_rotation.rotation_degrees.y + 1, 25 * delta)
		v_rotation.rotation_degrees.x = lerp(v_rotation.rotation_degrees.x, 0.0, 2 * delta)
	else:
		h_rotation.rotation_degrees.y = lerp(h_rotation.rotation_degrees.y, camrot_h, delta * h_acceleration)
		v_rotation.rotation_degrees.x = lerp(v_rotation.rotation_degrees.x, camrot_v, delta * v_acceleration)
	
	rotation_degrees.z = 0
	
	
#func _input(event):
	#if event is InputEventMouseMotion:
		#camrot_h += -event.relative.x * h_sensitivity
		#camrot_v += -event.relative.y * v_sensitivity
	#if event is InputEventMouseButton:
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
#
	#if (event is InputEventScreenDrag):
		#var new_pos: Vector2 = event.position.abs()
		#if (!last_pos):
			#last_pos = new_pos
		#var relative = (new_pos - last_pos).abs();
		#camrot_h += -relative.x * h_sensitivity
		#camrot_v += -relative.y * v_sensitivity
		#last_pos = new_pos

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camrot_h += -event.relative.x * h_sensitivity
		camrot_v += -event.relative.y * v_sensitivity
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	if event is InputEventScreenTouch and event.is_pressed():
		index = event.index
		last_pos = event.position
	if (event is InputEventScreenDrag and event.index == index):
		var new_pos: Vector2 = event.position
		var relative = (new_pos - last_pos);
		camrot_h += -relative.x * h_sensitivity
		camrot_v += -relative.y * v_sensitivity
		last_pos = new_pos

var last_pos = null;
var index = -1;
