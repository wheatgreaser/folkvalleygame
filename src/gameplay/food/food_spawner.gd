extends Node2D

const FOOD_SCENE_UID : String = "uid://dxm0vgfnpjqh7"

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func spawn_food(num_spawn : int) -> void:
	var food_scene : PackedScene = load(FOOD_SCENE_UID)
	for x : int in num_spawn:
		var food : StaticBody2D = food_scene.instantiate()
		food.position = Vector2(rng.randi_range(10, 1000), rng.randi_range(10, 1000))
		add_child(food)


	
