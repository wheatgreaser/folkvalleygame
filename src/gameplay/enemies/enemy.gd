extends CharacterBody2D


const SPEED = 50
var target_pos : Vector2
var chase_target : CharacterBody2D 
var chasing : bool = false

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if chasing:
		var direction : Vector2 = chase_target.global_position- global_position
		velocity = direction.normalized() * SPEED

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("soldiers") and not chasing:
		chase_target = body
		target_pos = body.global_position
		chasing = true
	pass


func _on_chase_range_body_exited(body: Node2D) -> void:
	if body.is_in_group("soldiers") and chasing and chase_target != null:
		chasing = false
		chase_target = null
	pass


func _on_kill_range_body_entered(body: Node2D) -> void:
	if body.is_in_group("soldiers"):
		body.queue_free()
