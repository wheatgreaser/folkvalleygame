extends CharacterBody2D


func _physics_process(_delta: float) -> void:
	move_and_collide(Vector2(0,0))
