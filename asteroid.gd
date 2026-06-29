extends Area2D

@export var speed = 300

func _physics_process(delta):
	position.y += speed * delta
