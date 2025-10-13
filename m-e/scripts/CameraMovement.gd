extends Camera2D

const SPEED = 200
const OFFSET = 10

const LIMIT = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_axis("Left", "Right")
	if global_position.x <= LIMIT && global_position.x >= -LIMIT:
		translate(Vector2(direction * SPEED * delta, 0))
	global_position.x = clampf(global_position.x, -LIMIT, LIMIT)
	
