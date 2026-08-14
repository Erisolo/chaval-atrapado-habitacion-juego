extends Sprite2D

@export var timeToWait = 10
@export var action: String
var timer = 0.0

func _process(delta: float) -> void:
	timer += delta
	if Input.is_action_pressed(action):
		timer = 0.0
		visible = false
		
	
	if timer >= timeToWait:
		if timer  >= 0.5 + timeToWait:
			visible = !visible
			timer = timeToWait
	else:
		visible = false
		
