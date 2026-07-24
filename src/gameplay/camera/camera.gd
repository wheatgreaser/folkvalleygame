extends Camera2D

@export var speed: float = 400
@export var start_pos:= Vector2(320,180)

func _ready() -> void:
	global_position = start_pos

func get_input() -> Vector2:
	var input_direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	return input_direction

func _process(delta: float) -> void:
	if position.x >= 300 and position.y >= 160:
		position += speed * get_input() * delta
	elif position.x < 300:
		position.x += 5 
	elif position.y < 160:
		position.y += 5 
	print(position)
