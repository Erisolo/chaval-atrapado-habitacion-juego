extends Sprite2D

@export var ui: Node2D
@export var event: Node

func _ready() -> void:
	ui.visible = false
	event.wasClicked.connect(_change_UI_visibility)
	
func _change_UI_visibility():
	ui.visible = !ui.visible
