extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	
	# Change when the actual sprites are finished
	if direction.x > 0:
		animated_sprite.flip_h = true
		animated_sprite.play("walk")
	elif direction.x < 0:
		animated_sprite.flip_h = false
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	velocity = direction * SPEED

	move_and_slide()
