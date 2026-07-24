extends CharacterBody2D

@export var is_selected = false
@onready var selector = $Selector

var target_pos : Vector2
var mouse_pos := Vector2(0,0)

func _ready() -> void:
	selector.hide()
	set_process(false)

func _physics_process(_delta: float) -> void:
	move_and_collide(Vector2(0,0))

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton and is_in_group("selected-units"):
		if event.button_index == MOUSE_BUTTON_RIGHT:
			set_process(true)
			target_pos = get_global_mouse_position()
	
	
func _process(delta: float) -> void:
	var diff = target_pos - global_position
	if diff.length() > 0.1:
		var dir = diff.normalized()
		global_position += dir * delta * 100
	else:
		set_process(false)


func is_in_selection_box(box: Rect2):
	return box.has_point(get_global_transform_with_canvas().origin)

func select():
	add_to_group('selected-units')
	selector.show()
	

func deselect():
	remove_from_group('selected-units')
	selector.hide()


func _on_area_2d_selection_toggled(selection: Variant) -> void:
	is_selected = selection
	
		
