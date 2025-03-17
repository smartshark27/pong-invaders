extends CharacterBody2D

signal game_over

const SPEED = 800.0


func _physics_process(delta):
	velocity = Vector2(0, 0)

	if Input.is_action_pressed("mouse_button_left"):
		var target = (get_global_mouse_position() - position).normalized().x
		velocity.x = target * SPEED
		move_and_slide()
