extends Control

@export var speed : float
@export var finishPos : float
const music = preload("uid://dyfugeuhf83dd")

func _ready() -> void:
	SoundManager.stop_music()
	SoundManager.play_music(music, 1)
func _process(delta: float) -> void:
	if position.y > finishPos :
		position.y -= speed*delta
	else:
		pass	#TODO HACER Q ACABE EL JUEGO COÑO
