extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_radius: float = 2300.0

func _on_timer_timeout() -> void:
	var enemy := enemy_scene.instantiate()
	var angle := randf_range(0, TAU)
	enemy.global_position = global_position + Vector2.RIGHT.rotated(angle) * spawn_radius
	get_parent().add_child(enemy)
