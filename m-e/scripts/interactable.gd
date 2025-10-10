extends RigidBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
var isIn = false

func _input(event: InputEvent) -> void:
	if isIn && event.is_action_pressed("Interact"):
		print("Interacted")

func _on_area_2d_body_entered(body: Node2D) -> void:
	isIn = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	isIn = false
