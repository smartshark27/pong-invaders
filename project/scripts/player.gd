extends CharacterBody2D

signal game_over

const SPEED = 800.0


func _physics_process(delta):
	if not get_parent().running:
		# Allows enemies to not player down off the screen during game over
		# screen
		move_and_slide()
		return
	else:
		# Player remains solid while in game
		velocity = Vector2(0, 0)

	if Input.is_action_pressed("mouse_button_left"):
		# Move player towards mouse on X axis
		var target = (get_global_mouse_position() - position).normalized().x
		velocity.x = target * SPEED
		move_and_slide()
