extends Node

const PLAYER_SCENE_UID : String = "uid://cvk7uk0k1a3nu"
var player_scene : PackedScene = preload(PLAYER_SCENE_UID)

@onready var entity_root : Node2D = %EntityRoot
@onready var effects_root : Node2D = %EffectsRoot
@onready var level_root : Node2D = %LevelRoot

func _ready() -> void:
	var player = player_scene.instantiate()
	entity_root.add_child(player)
	
		
func _process(delta: float) -> void:
	pass
