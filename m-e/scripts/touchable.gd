extends Area2D

signal wasClicked

func _ready() -> void:
	input_event.connect(on_input_event)


func on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event.is_action_pressed("LeftClick"):
		wasClicked.emit()
