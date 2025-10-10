extends Area2D
@onready var ui_sprite: AnimatedSprite2D = $"AnimatedSprite2D"

func _ready() -> void:
	ui_sprite.visible = false

func _on_body_entered(body: Node2D) -> void:
	ui_sprite.visible = true

func _on_body_exited(body: Node2D) -> void:
	ui_sprite.visible = false
