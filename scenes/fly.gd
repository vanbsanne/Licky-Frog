extends CharacterBody2D

const SPEED = 25
const HOPPING = 10
var hopping_direction = 1
@onready var timer: Timer = $Timer

func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta
	position.y	+= HOPPING * delta * hopping_direction # * randi_range(-10, 10)
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_timer_timeout() -> void:
		hopping_direction *= -1
