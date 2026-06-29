extends Node2D

var time_alive = 0.0

func _process(delta):
	time_alive += delta

@export var asteroid_scene : PackedScene

func _ready():
	var asteroid = asteroid_scene.instantiate()
	add_child(asteroid)


func _on_timer_timeout() -> void:
	var asteroid = asteroid_scene.instantiate()
	
	asteroid.position.x = randf_range(0, 1150)
	asteroid.position.y = -50
	
	asteroid.speed = 200 + time_alive * 10
	
	add_child(asteroid)
	
	
