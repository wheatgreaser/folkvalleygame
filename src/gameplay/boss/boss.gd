extends CharacterBody2D


const SPEED = 150
var target_pos : Vector2
var chase_target : CharacterBody2D 
var chasing : bool = false
var rng : RandomNumberGenerator = RandomNumberGenerator.new()
@onready var anim_player = $AnimationPlayer
var unit_list = []
func _ready() -> void:
	for unit in get_tree().get_nodes_in_group("soldiers"):
		unit_list.append(unit)
	rng.randomize()

func _physics_process(delta: float) -> void:
	anim_player.play("boss_move")
	for unit in get_tree().get_nodes_in_group("soldiers"):
		if unit != null:
			chase_target = unit
			break
	if chase_target != null:
		var direction : Vector2 = chase_target.global_position - global_position
		position += direction.normalized() * 50 * delta





func _on_kill_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("killable"):
		body.queue_free()
