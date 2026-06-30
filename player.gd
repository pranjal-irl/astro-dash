extends CharacterBody2D

@export var speed = 700

func _physics_process(delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * speed
	move_and_slide()
	
	position.x = clamp(position.x, 0, 1152)
	position.y = clamp(position.y, 324, 648)
