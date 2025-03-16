extends Node2D

@export var enemy_scene: PackedScene

var score = 0


func increment_score():
	score += 1
	$HUD/Score.text = "Score: " + str(score)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_game_over() -> void:
	_game_over()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	_game_over()


func _game_over() -> void:
	# Display game over and restart button
	$GameOverMenu.show()
