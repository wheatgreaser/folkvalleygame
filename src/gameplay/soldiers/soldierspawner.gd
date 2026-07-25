extends Node2D

const SOLDIER_SCENE_UID : String = "uid://c08f3musdqkra"

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func spawn_soldiers(num_spawn : int) -> void:
	var soldier_scene : PackedScene = load(SOLDIER_SCENE_UID)
	for x : int in num_spawn:
		var soldier : CharacterBody2D = soldier_scene.instantiate()
		soldier.position = Vector2(rng.randi_range(-50, 50), rng.randi_range(-50, 50)) + get_viewport().get_camera_2d().global_position
		add_child(soldier)
		
func _on_button_button_down() -> void:
	if Food.food_count > 5:
		spawn_soldiers(1)
		Food.food_count -= 5

func _process(delta: float) -> void:
	#global_position = get_viewport().get_camera_2d().global_position
	pass
