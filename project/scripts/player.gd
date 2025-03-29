extends CharacterBody2D

signal game_over

const SPEED = 300.0


func _physics_process(delta):
	velocity.x = 0

	if get_parent().running and Input.is_action_pressed("mouse_button_left"):
		# Move player smoothly towards mouse on X axis
		var diff = get_global_mouse_position().x - position.x
		velocity.x = diff * SPEED * delta

	move_and_slide()
