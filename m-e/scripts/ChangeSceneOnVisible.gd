extends Label

@export var new_scene: String

signal changeScene

func _on_visibility_changed() -> void:
	print(visible)
	if(visible == true):
		get_tree().paused = true
		await get_tree().create_timer(2.0).timeout
		get_tree().paused = false
		changeScene.emit("res://scenes/game.tscn")
