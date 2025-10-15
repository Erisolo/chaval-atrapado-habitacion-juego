extends Node2D

@export var labels: Array[AnimatedSprite2D]
@export var secondsBetweenLabels: int
@export var hamster: Sprite2D
const music = preload("uid://dhcerbp8kb27q")
const dead = preload("uid://q52vm5wytak")
const word = preload("uid://dvmgkrtgmxe1x")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.stop_music()
	for n in labels.size():
		await get_tree().create_timer(secondsBetweenLabels).timeout
		labels[n].visible = true
		if n < 3 :
			SoundManager.play_sound(word)
		else:
			SoundManager.play_sound(dead)
		
	SoundManager.play_music(music, 0.5)
	await get_tree().create_timer(secondsBetweenLabels).timeout
	for n in labels:
		n.play("default")
	
	
	await get_tree().create_timer(secondsBetweenLabels).timeout
	hamster.visible = true;
