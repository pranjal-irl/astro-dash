extends Area2D

@export var speed = 200
	
func _physics_process(delta):
	position.y += speed * delta
	
	if position.y>700 :
		get_tree().current_scene.score += 1
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().current_scene.game_over()
		
