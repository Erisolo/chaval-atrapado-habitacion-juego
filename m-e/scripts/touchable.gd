extends Area2D

signal wasClicked
var doneOnce = false

func _ready() -> void:
	input_event.connect(on_input_event)


func on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event.is_action_pressed("LeftClick"):
		if !doneOnce:
			wasClicked.emit()
			doneOnce = true
