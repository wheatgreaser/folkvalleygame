extends CharacterBody2D

@export var is_selected = false
@onready var selector = $Selector
@onready var anim_player = $AnimationPlayer

var target_pos : Vector2
var mouse_pos := Vector2(0,0)

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	remove_from_group("killable")
	selector.hide()
	set_physics_process(false)

func _physics_process(delta: float) -> void:
	var next_pos : Vector2 = $NavigationAgent2D.get_next_path_position()
	var diff : Vector2 = next_pos - global_position
	if not $NavigationAgent2D.is_navigation_finished():
		var dir : Vector2 = diff.normalized()
		global_position += dir * delta * 200
		anim_player.play("move")
	else:
		anim_player.play("idle")
		set_physics_process(false)
	move_and_collide(Vector2(0,0))

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton and is_in_group("selected-units"):
		if event.button_index == MOUSE_BUTTON_RIGHT:
			set_physics_process(true)
			target_pos = get_global_mouse_position()
			
			$NavigationAgent2D.target_position = target_pos 

	
func _process(delta: float) -> void:
	pass
	
func is_in_selection_box(box: Rect2) -> bool:
	return box.has_point(get_global_transform_with_canvas().origin)

func select() -> void:
	add_to_group('selected-units')
	selector.show()
	

func deselect() -> void:
	remove_from_group('selected-units')
	selector.hide()


func _on_area_2d_selection_toggled(selection: Variant) -> void:
	is_selected = selection

func _on_food_timer_timeout() -> void:
	Food.food_count -= 1


func _on_spawn_safe_timeout() -> void:
	add_to_group("killable")
