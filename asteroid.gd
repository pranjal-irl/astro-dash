extends Area2D

@export var speed = 300

func _physics_process(delta):
	position.y += speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("GAME OVER")
		
