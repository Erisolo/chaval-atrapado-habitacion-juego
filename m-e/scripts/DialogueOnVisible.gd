extends Node2D

@export var waitTime = 0
@export var dialogue: DialogueResource
@export var startPoint = "start"
@export var visibleNode: CanvasItem

func _ready() -> void:
	visibleNode.visibility_changed.connect(_start_dialogue)

func _start_dialogue():
	if visibleNode.visible:
		await get_tree().create_timer(waitTime).timeout
		DialogueManager.show_dialogue_balloon(dialogue, startPoint)
