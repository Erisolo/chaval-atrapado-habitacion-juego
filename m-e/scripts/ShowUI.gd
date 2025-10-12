extends Node2D
@export var ui: Node
@export var area = self

func _ready() -> void:
	ui.visible = false
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	ui.visible = true

func _on_body_exited(body: Node2D) -> void:
	ui.visible = false
