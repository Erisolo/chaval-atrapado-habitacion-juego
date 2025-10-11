extends Sprite2D
@export var rotationAmount : float

func _process(delta: float) -> void:
	rotation += rotationAmount * delta
