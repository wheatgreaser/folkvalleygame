extends Node

const PLAYER_SCENE_UID : String = "uid://cvk7uk0k1a3nu"
const CAMERA_UID : String = "uid://cftvanod25g6i"
const LEVEL_SCENE_UID : String = "uid://cwv5k8osui84u"

var player_scene : PackedScene = preload(PLAYER_SCENE_UID)
var camera_scene : PackedScene = preload(CAMERA_UID)


@onready var entity_root : Node2D = %EntityRoot
@onready var effects_root : Node2D = %EffectsRoot
@onready var level_root : Node2D = %LevelRoot

func _player_init() -> void:
	var player : CharacterBody2D = player_scene.instantiate()
	var camera : Camera2D = camera_scene.instantiate()
	if player != null and camera != null:
		entity_root.add_child(player)
		player.add_child(camera)
	else:
		print("player not found son")

func _camera_init(start_position : Vector2) -> void:
	var camera : Camera2D = camera_scene.instantiate()
	if camera != null:
		camera.start_pos = start_position
		entity_root.add_child(camera)
	else:
		print("camera not found son")
	
		
func _load_level() -> void:
	var level_scene : PackedScene = preload(LEVEL_SCENE_UID)
	var level : Node2D = level_scene.instantiate()
	level_root.add_child(level)
		

func _ready() -> void:
	_camera_init(Vector2(300,300))
	_load_level()
	
	
	
		
func _process(_delta: float) -> void:
	pass
