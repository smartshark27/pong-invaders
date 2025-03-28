extends CharacterBody2D

signal game_over

const SPEED = 1000.0


func _physics_process(_delta):
	velocity.x = 0

	if get_parent().running and Input.is_action_pressed("mouse_button_left"):
		# Move player towards mouse on X axis
		var diff = get_global_mouse_position() - position
		var target = diff.normalized().x
		velocity.x = target * SPEED

	move_and_slide()
