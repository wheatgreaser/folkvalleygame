extends Control

const GROW_SCENE_UID : String = "uid://oq78he05b01v"

func _ready() -> void:
	var grow_scene : PackedScene = load(GROW_SCENE_UID)
	var grow_ui : Control = grow_scene.instantiate()
	add_child(grow_ui)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
