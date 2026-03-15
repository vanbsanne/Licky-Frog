extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast: RayCast2D = $RayCast2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	
	if Input.is_action_pressed("lick"):
		animated_sprite.play("lick")
		if ray_cast.is_colliding() == true:
			var fly = ray_cast.get_collider()
			print(fly)
			fly.free()
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("idle")
