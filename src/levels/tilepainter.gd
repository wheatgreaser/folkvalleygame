extends TileMapLayer


var rng : RandomNumberGenerator = RandomNumberGenerator.new()
func _ready() -> void:
	for x in 640:
		for y in 360:
			var toss : int = rng.randi() % 2
			if toss == 0:
				set_cell(Vector2i(x,y), 0, Vector2i(9, 10))
			else:
				set_cell(Vector2i(x,y), 0, Vector2i(9, 18))


func _process(_delta: float) -> void:
	pass
