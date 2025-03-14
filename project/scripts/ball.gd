extends CharacterBody2D


const SPEED = 600.0
const PLAYER_BOUNCE_ROTATE_ZONE_MULTIPLIER = 2


func _ready() -> void:
	# Move ball down at random angle at start
	velocity.y = SPEED
	velocity = velocity.rotated(randf_range(-1, 1))


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider == get_parent().get_node("Player"):
			# Calculate bounce direction based on collision point on player
			velocity = Vector2(0, -SPEED)
			var collider_x = collider.position.x
			var collider_width = collider.get_node("CollisionShape2D").shape.size.x
			var direction = (position.x - collider_x) / collider_width * PLAYER_BOUNCE_ROTATE_ZONE_MULTIPLIER
			velocity = velocity.rotated(direction)
		elif collider == get_parent().get_node("Walls"):
			velocity = velocity.bounce(collision.get_normal())
