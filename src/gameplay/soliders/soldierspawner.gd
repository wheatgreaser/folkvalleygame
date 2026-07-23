extends Node2D

const SOLDIER_SCENE_UID : String = "uid://c08f3musdqkra"

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func spawn_soldiers(num_spawn : int) -> void:
	var soldier_scene : PackedScene = load(SOLDIER_SCENE_UID)
	for x : int in num_spawn:
		var soldier : CharacterBody2D = soldier_scene.instantiate()
		soldier.position = Vector2(0 + rng.randi()%100,0 + rng.randi()%100)
		add_child(soldier)
