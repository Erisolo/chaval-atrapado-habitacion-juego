extends Node2D

@export var labels: Array[AnimatedSprite2D]
@export var secondsBetweenLabels: int
@export var hamster: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in labels:
		await get_tree().create_timer(secondsBetweenLabels).timeout
		n.visible = true
	
	await get_tree().create_timer(secondsBetweenLabels).timeout
	for n in labels:
		n.play("default")
	
	await get_tree().create_timer(secondsBetweenLabels).timeout
	hamster.visible = true;
