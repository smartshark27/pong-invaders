extends CharacterBody2D

signal game_over

const SPEED = 800.0


func _physics_process(delta):
	velocity = Vector2(0, 0)

	if Input.is_action_pressed("mouse_button_left"):
		var target = (get_global_mouse_position() - position).normalized().x
		velocity.x = target * SPEED

	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		# End game if collides with an enemy
		#if collider == get_parent().get_node("Player"):
			#enemy_hit.emit()
			#$CollisionShape2D.set_deferred("disabled", true)
