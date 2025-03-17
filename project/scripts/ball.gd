extends CharacterBody2D

signal hit_enemy

const INIT_SPEED = 600.0
const SPEED_INCREASE = 25.0
const PLAYER_BOUNCE_ROTATE_ZONE_MULTIPLIER = 2

var speed = INIT_SPEED


func _ready() -> void:
	# Move ball down at random angle at start
	velocity.y = speed
	velocity = velocity.rotated(randf_range(-1, 1))


func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.name == "Player":
			_bounce_off_player(collider)
		elif collider.name == "Walls":
			velocity = velocity.bounce(collision.get_normal())
		else: # Assuming enemy hit
			hit_enemy.emit(collider)
			velocity = velocity.bounce(collision.get_normal())


func _bounce_off_player(collider):
	# Increase score. Remove once enemies are added
	#get_parent().increment_score()

	# Increase speed
	speed += SPEED_INCREASE

	# Calculate bounce direction based on collision point on player
	velocity = Vector2(0, -speed)
	var collider_x = collider.position.x
	var collider_width = collider.get_node("CollisionShape2D").shape.size.x
	var direction = (position.x - collider_x) / collider_width * PLAYER_BOUNCE_ROTATE_ZONE_MULTIPLIER
	velocity = velocity.rotated(direction)


func _on_player_game_over() -> void:
	# Stop the ball
	speed = 0
