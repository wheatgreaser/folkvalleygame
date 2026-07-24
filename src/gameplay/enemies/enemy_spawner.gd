extends Node2D

const ENEMY_SCENE_UID : String = "uid://dgnuqeicgk1cs"

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func spawn_enemies(num_spawn : int) -> void:
	var enemy_scene : PackedScene = load(ENEMY_SCENE_UID)
	for x : int in num_spawn:
		var enemy : CharacterBody2D = enemy_scene.instantiate()
		enemy.position = Vector2(rng.randi_range(10, 1000), rng.randi_range(10, 1000))
		add_child(enemy)
