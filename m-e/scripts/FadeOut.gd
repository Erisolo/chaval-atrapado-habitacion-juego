extends Sprite2D
var tween

func _create_fade_tween() -> void:
	tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 2.0)
	tween.tween_callback(queue_free)
