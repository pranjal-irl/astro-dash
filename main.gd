extends Node2D

@export var asteroid_scene : PackedScene

func _ready():
	var asteroid = asteroid_scene.instantiate()
	add_child(asteroid)
