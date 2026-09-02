extends Area2D

@export var damage_per_tick: float = 10.0

func _on_damage_tick_timeout() -> void:
	for area in get_overlapping_areas():
		get_parent().take_damage(damage_per_tick)
