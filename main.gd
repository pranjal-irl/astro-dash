extends Node2D

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

@export var asteroid_scene : PackedScene

func _ready():
	var asteroid = asteroid_scene.instantiate()
	add_child(asteroid)


func _on_timer_timeout() -> void:
	var asteroid = asteroid_scene.instantiate()
	
	asteroid.position.y = -50
	
	var lane_index = randi_range(0, lanes.size() - 1)
	var lane = lanes[lane_index]
	asteroid.position.x = randf_range(lane.x, lane.y)
	
	asteroid.speed = min(200 + time_alive * 10, 1100)
	
	add_child(asteroid)
	
	
