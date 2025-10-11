extends Sprite2D
var tweens
signal imWatching

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tweens = create_tween()
	tweens.set_loops()
	tweens.tween_callback(imWatching.emit)
	tweens.tween_property(self, "modulate:a", 0.0, 0.1)
	tweens.tween_interval(randf() * 3 + 2)
	tweens.tween_property(self, "modulate:a", 1.0, 0.5)
	tweens.tween_callback(imWatching.emit)
	tweens.tween_interval(1.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
