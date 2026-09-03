extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_radius: float = 2300.0
@export var initial_spawn_interval: float = 2.0
@export var min_spawn_interval: float = 0.4
@export var difficulty_ramp_duration: float = 60.0

var spawn_count: int = 0
var elapsed_time: float = 0.0

func _process(delta: float) -> void:
	elapsed_time += delta
	var t := clampf(elapsed_time / difficulty_ramp_duration, 0.0, 1.0)
	$Timer.wait_time = lerpf(initial_spawn_interval, min_spawn_interval, t)

func _on_timer_timeout() -> void:
	var enemy := enemy_scene.instantiate()
	spawn_count += 1
	enemy.name = "Enemy(%d)" % spawn_count

	var angle := randf_range(0, TAU)
	enemy.global_position = global_position + Vector2.RIGHT.rotated(angle) * spawn_radius
	get_parent().add_child(enemy)
