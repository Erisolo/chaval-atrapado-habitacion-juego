extends Control

@export var speed : float
@export var finishPos : float

func _process(delta: float) -> void:
	if position.y > finishPos :
		position.y -= speed*delta
	else:
		pass	#TODO HACER Q ACABE EL JUEGO COÑO
