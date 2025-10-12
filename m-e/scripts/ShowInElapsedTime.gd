extends Node2D

@export var labels: Array[Label]
@export var secondsBetweenLabels: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in labels:
		await get_tree().create_timer(secondsBetweenLabels).timeout
		n.visible = true
