extends Node2D

@onready var game_over_screen = $"CanvasLayer/GameOverScreen"

var score = 0

var lanes = [
	Vector2(0, 230),
	Vector2(230, 460),
	Vector2(460, 690),
	Vector2(690, 920),
	Vector2(920,1152)
]

var time_alive = 0.0

func _process(delta):
	time_alive += delta
	
	$CanvasLayer/Score.text = "Score: " + str(score)
	
	if score>Global.high_score :
		Global.high_score = score
		
	$CanvasLayer/HighScore.text = "High Score: " + str(Global.high_score)

@export var asteroid_scene : PackedScene

func _ready():
	$Timer.stop()
	game_over_screen.visible = false

	if Global.restarting:
		Global.restarting = false
		$CanvasLayer/StartScreen.visible = false
		$Timer.start()
	else:
		$CanvasLayer/StartScreen.visible = true

func _on_timer_timeout() -> void:
	var asteroid = asteroid_scene.instantiate()
	
	asteroid.position.y = -20
	
	var lane_index = randi_range(0, lanes.size() - 1)
	var lane = lanes[lane_index]
	asteroid.position.x = randf_range(lane.x, lane.y)
	
	asteroid.speed = min(200 + time_alive * 10, 1100)
	
	add_child(asteroid)
	
	


func _on_start_pressed() -> void:
	get_node("CanvasLayer/StartScreen").visible = false
	$Timer.start()


func _on_restart_pressed() -> void:
	Global.restarting = true
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func game_over():
	get_tree().paused = true
	$CanvasLayer/GameOverScreen.visible = true
	
	$CanvasLayer/GameOverScreen/ScoreLabel.text = "Score: " + str(score)
	$CanvasLayer/GameOverScreen/HighScoreLabel.text = "High Score: " + str(Global.high_score)
	
