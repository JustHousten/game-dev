extends CharacterBody2D

var player: Node2D
@export var speed: float = 350.0
@export var stop_distance: float = 100.0
@export var max_health: float = 30.0
var current_health: float

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	current_health = max_health

func take_damage(amount: float) -> void:
	current_health -= amount
	print(name, " health: ", current_health)

func _physics_process(_delta: float) -> void:
	if not player:
		return

	var distance := global_position.distance_to(player.global_position)

	if distance > stop_distance:
		velocity = global_position.direction_to(player.global_position) * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
