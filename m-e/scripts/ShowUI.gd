extends Area2D
@export var ui: Node

func _ready() -> void:
	ui.visible = false
	self.body_entered.connect(_on_body_entered)
	self.body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	ui.visible = true

func _on_body_exited(body: Node2D) -> void:
	ui.visible = false
