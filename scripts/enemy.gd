extends CharacterBody2D

@export var speed: float = 350.0
@export var stop_distance: float = 100.0

var player: Node2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta: float) -> void:
	if not player:
		return

	var distance := global_position.distance_to(player.global_position)

	if distance > stop_distance:
		velocity = global_position.direction_to(player.global_position) * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
