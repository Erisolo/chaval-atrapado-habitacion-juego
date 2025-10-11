extends Area2D
@export var ui: Node

func _ready() -> void:
	ui.visible = false

func _on_body_entered(body: Node2D) -> void:
	ui.visible = true

func _on_body_exited(body: Node2D) -> void:
	ui.visible = false
