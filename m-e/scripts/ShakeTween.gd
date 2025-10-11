extends Sprite2D

var tween: Tween
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "position:x", 10.0, 1.0).set_trans(Tween.TRANS_BOUNCE)
	tween.tween_property(self, "position:x", -10.0, 1.0).set_trans(Tween.TRANS_BOUNCE)
	pass # Replace with function body.
