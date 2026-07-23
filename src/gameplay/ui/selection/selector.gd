extends Control

var selecting: bool = false
var drag_start : Vector2
var select_box : Rect2

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			selecting = true
			drag_start = event.position
		else:
			selecting = false
			if drag_start.is_equal_approx(event.position):
				select_box = Rect2(event.position, Vector2.ZERO)
			
			queue_redraw()
	elif selecting and event is InputEventMouseMotion:
		var x_min : float = min(drag_start.x, event.position.x)
		var y_min : float = min(drag_start.y, event.position.y)
		select_box = Rect2(x_min, y_min,
		max(drag_start.x, event.position.x) - x_min,
		max(drag_start.y, event.position.y) - y_min)
		update_selected_units()
		queue_redraw()
	

func _draw() -> void:
	if not selecting:
		return
	draw_rect(select_box, Color('#00ff0066'))
	draw_rect(select_box, Color('#00ff00'), false, 2.0)

func update_selected_units() -> void:
	for unit in get_tree().get_nodes_in_group("selectable-units"):
		if unit.is_in_selection_box(select_box):
			unit.select()
		else:
			unit.deselect()
		
