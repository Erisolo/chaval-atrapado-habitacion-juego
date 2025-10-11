extends RigidBody2D

const MOVEMENT = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Up"):
		position.y -= MOVEMENT * delta
	pass
