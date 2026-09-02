extends CharacterBody2D

@export var speed: float = 300.0
@export var max_health: float = 100.0

var current_health: float
var is_dead: bool = false

func _ready() -> void:
	current_health = max_health

func take_damage(amount: float) -> void:
	if is_dead:
		return
	current_health -= amount
	print("player health: ", current_health)
	if current_health <= 0:
		is_dead = true
		get_tree().reload_current_scene()

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
