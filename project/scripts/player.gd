extends CharacterBody2D

const SPEED = 500


func _physics_process(delta):
	if Input.is_action_pressed("mouse_button_left"):
		var target = (get_global_mouse_position() - position).normalized().x
		velocity.x = target * SPEED
		move_and_slide()
