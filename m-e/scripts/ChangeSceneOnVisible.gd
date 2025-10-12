extends Area2D

@export var new_scene: String

signal win


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body: Node2D) -> void:
	win.emit()
	SceneManager.changeScene("res://scenes/game.tscn")
