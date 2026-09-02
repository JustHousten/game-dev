extends Area2D

@export var damage_per_hit: float = 20.0

func _on_attack_timer_timeout() -> void:
	for area in get_overlapping_areas():
		area.get_parent().take_damage(damage_per_hit)
