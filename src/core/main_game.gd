extends Node

const PLAYER_SCENE_UID : String = "uid://cvk7uk0k1a3nu"
const CAMERA_UID : String = "uid://cftvanod25g6i"
const LEVEL_SCENE_UID : String = "uid://cwv5k8osui84u"
const GROW_COLONY_UID : String = "uid://oq78he05b01v"
const SOLDIER_SPAWNER : String = "uid://c5i6caid80xkq"
const FOOD_SPAWNER : String = "uid://bg4ubjfpcww4l"
const SELECTOR_SCENE : String = "uid://r6mkc8u6ueqk"
const FOOD_DISPLAY_UID : String = "uid://gcw7vctcsb3g"
const ENEMY_SPAWNER_UID : String = "uid://dc2e6dp30r553"
const BOSS_SPAWNER_UID : String = "uid://b7aq6usxu1r12"
const TITLE_SCREEN_UID : String = "uid://qs1wgpqx7shp"
const TUTORIAL_SCENE_UID : String = "uid://b4j8lxbf2qt8e"

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
	var level_scene : PackedScene = preload(TITLE_SCREEN_UID)
	var level : Control = level_scene.instantiate()
	level_root.add_child(level)

func _load_UI () -> void:
	var food_display : PackedScene = preload(FOOD_DISPLAY_UID)
	var food_display_ui : Control = food_display.instantiate()
	HUD_root.add_child(food_display_ui)

func _starting_soldiers() -> void:
	var soldier_spawner_scene : PackedScene = preload(SOLDIER_SPAWNER)
	var soldier_spawner : Node2D = soldier_spawner_scene.instantiate()
	entity_root.add_child(soldier_spawner)
	soldier_spawner.spawn_soldiers(10)	

func _starting_food() -> void:
	var food_spawner_scene : PackedScene = preload(FOOD_SPAWNER)
	var food_spawner : Node2D = food_spawner_scene.instantiate()
	entity_root.add_child(food_spawner)
	food_spawner.spawn_food(100)	

func _create_enemies() -> void:
	var enemy_spawner_scene : PackedScene = preload(ENEMY_SPAWNER_UID)
	var enemy_spawner : Node2D = enemy_spawner_scene.instantiate()
	entity_root.add_child(enemy_spawner)
	enemy_spawner.spawn_enemies(10)	

func _selector_init() -> void:
	var selector_scene : PackedScene = preload(SELECTOR_SCENE)
	var selector : Control = selector_scene.instantiate()
	HUD_root.add_child(selector)

func _toggle_display() -> void:
	pass

func _boss_spawning() -> void:
	var boss_spawner_scene : PackedScene = preload(BOSS_SPAWNER_UID)
	var boss_spawner : Node2D = boss_spawner_scene.instantiate()
	entity_root.add_child(boss_spawner)

func _ready() -> void:
	_load_level()
	var colonize_button : Button = get_node("%LevelRoot/TitleScreen/Colonize")
	var tutorial_button : Button = get_node("%LevelRoot/TitleScreen/Tutorial")
	colonize_button.button_down.connect(_colonize_button_down)
	tutorial_button.button_down.connect(_tutorial_button_down)

func _process(_delta: float) -> void:
	pass

func _load_game_scene() -> void:
	var level_scene : PackedScene = preload(LEVEL_SCENE_UID)
	var level : Node2D = level_scene.instantiate()
	level_root.add_child(level)

func _load_tut_scene() -> void:
	var level_scene : PackedScene = preload(TUTORIAL_SCENE_UID)
	var level : Node2D = level_scene.instantiate()
	level_root.add_child(level)
	
func _load_game() -> void:
	get_node("%LevelRoot/TitleScreen").queue_free()
	_load_game_scene()
	_camera_init()
	_selector_init()
	_create_enemies()
	_starting_soldiers()
	_starting_food()
	_load_UI()
	_boss_spawning()
	
func _move_selected_units(pos : Vector2) -> void:
	var units = get_tree().get_nodes_in_group('selected-units')
	for unit in units:
		unit.move(pos)
func _colonize_button_down() -> void:
	_load_game()

func _tutorial_button_down() -> void:
	_load_tut_scene()
	_camera_init()
	_selector_init()
	_starting_soldiers()
	_starting_food()
	
