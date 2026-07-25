extends TileMapLayer


var rng : RandomNumberGenerator = RandomNumberGenerator.new()
func _ready() -> void:
	for x : int in get_viewport().size.x:
		for y : int in get_viewport().size.y:
			var toss : int = rng.randi() % 2
			if toss == 0:
				set_cell(Vector2i(x,y), 0, Vector2i(9, 14))
			else:
				set_cell(Vector2i(x,y), 0, Vector2i(9, 18))


func _process(_delta: float) -> void:
	if len(get_tree().get_nodes_in_group("soldiers")) <= 0:
		get_tree().change_scene_to_file("res://src/levels/death.tscn")
	elif Food.food_count <= 0:
		get_tree().change_scene_to_file("res://src/levels/death.tscn")
