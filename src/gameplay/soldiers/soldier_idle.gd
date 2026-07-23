extends CharacterBody2D

var is_selected = false

func _physics_process(_delta: float) -> void:
	move_and_collide(Vector2(0,0))

func _process(delta: float) -> void:
	var direction : Vector2 = get_viewport().get_mouse_position() - position
	velocity = direction.normalized() * 100
	move_and_slide()
		

func _on_area_2d_selection_toggled(selection: Variant) -> void:
	is_selected = selection
