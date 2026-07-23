extends Node

const PLAYER_SCENE_UID : String = "uid://cvk7uk0k1a3nu"
const CAMERA_UID : String = "uid://cftvanod25g6i"
const LEVEL_SCENE_UID : String = "uid://cwv5k8osui84u"
const GROW_UID : String = "uid://oq78he05b01v"
const SOLDIER_SPAWNER : String = "uid://c5i6caid80xkq"
const SELECTOR_SCENE : String = "uid://r6mkc8u6ueqk"

var player_scene : PackedScene = preload(PLAYER_SCENE_UID)
var camera_scene : PackedScene = preload(CAMERA_UID)

@onready var entity_root : Node2D = %EntityRoot
@onready var effects_root : Node2D = %EffectsRoot
@onready var level_root : Node2D = %LevelRoot

@onready var HUD_root : Control = %HudRoot

func _player_init() -> void:
	var player : CharacterBody2D = player_scene.instantiate()
	var camera : Camera2D = camera_scene.instantiate()
	if player != null and camera != null:
		entity_root.add_child(player)
		player.add_child(camera)
	else:
		print("player not found son")

func _camera_init(start_position := Vector2((get_viewport().size.x)/2,(get_viewport().size.y)/2)) -> void:
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

func _load_UI () -> void:
	var grow_button_scene : PackedScene = preload(GROW_UID)
	var grow_button : Control = grow_button_scene.instantiate()
	HUD_root.add_child(grow_button)

func _starting_soldiers() -> void:
	var soldier_spawner_scene : PackedScene = preload(SOLDIER_SPAWNER)
	var soldier_spawner : Node2D = soldier_spawner_scene.instantiate()
	entity_root.add_child(soldier_spawner)
	soldier_spawner.spawn_soldiers(10)	

func _selector_init() -> void:
	var selector_scene : PackedScene = preload(SELECTOR_SCENE)
	var selector : Control = selector_scene.instantiate()
	HUD_root.add_child(selector)
	

func _ready() -> void:
	_load_level()
	_camera_init()
	_load_UI()
	_selector_init()
	_starting_soldiers()
	
	
	
		
func _process(_delta: float) -> void:
	pass
