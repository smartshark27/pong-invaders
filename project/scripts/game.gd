extends Node2D

@export var enemy_scene: PackedScene

const ENEMY_INIT_SPEED = 50
const ENEMY_INCREMENT_SPEED = 20

var running = true

var _score = 0
var _enemy_speed = ENEMY_INIT_SPEED


func _on_player_game_over() -> void:
	_game_over()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	_game_over()


func _on_enemy_timer_timeout() -> void:
	_spawn_enemy()


func _on_ball_hit_enemy(collider: Object) -> void:
	_increment_score()
	collider.free()


func _spawn_enemy() -> void:
	var enemy = enemy_scene.instantiate()

	# Set enemy to random location on path
	var spawn_location = $EnemySpawnLine/EnemySpawnPoint
	spawn_location.progress_ratio = randf()
	enemy.position = spawn_location.position

	enemy.linear_velocity = Vector2(0, 1.0 * _enemy_speed)

	$Enemies.add_child(enemy)

	# Increment enemy speed after each new spawn
	_enemy_speed += ENEMY_INCREMENT_SPEED


func _increment_score():
	if running:
		_score += 1
		$HUD/Score.text = "Score: " + str(_score)


func _game_over() -> void:
	running = false
	$GameOverMenu.show()
