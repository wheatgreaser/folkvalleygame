extends Node2D

const BOSS_SCENE_UID : String = "uid://bde8vvjg2o8d5"

@onready var boss_label = $BossCanvas/BossTime/BossLabel
var boss_spawned : bool = false	
var boss : CharacterBody2D
func _ready() -> void:
	$BossSpawnTimer.start()

func _spawn_boss() -> void:
	var boss_scene : PackedScene = load(BOSS_SCENE_UID)
	boss  = boss_scene.instantiate()
	boss.position = Vector2(200,200)
	boss.scale = Vector2(2,2)
	add_child(boss)

func _process(delta: float) -> void:
	if not boss_spawned:
		boss_label.text = "BOSS SPAWNS IN: " + str(roundi($BossSpawnTimer.time_left))
	else:
		boss_label.text = "BOSS DIES IN: " + str(roundi($BossDeathTimer.time_left))
		
func _on_boss_spawn_timer_timeout() -> void:
	_spawn_boss() 
	boss_spawned = true
	$BossDeathTimer.start()


func _on_boss_death_timer_timeout() -> void:
	boss.queue_free()
	boss_spawned = false
	$BossSpawnTimer.start()
	$BossDeathTimer.wait_time += 5
