extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200.0
var dialogueActive = false

func _ready() -> void:
	DialogueManager.dialogue_started.connect(dialogueOn)
	DialogueManager.dialogue_ended.connect(dialogueOff)
	position = PlayerInfo.lastPosition


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	if !dialogueActive:
		if direction.y > 0:
			animated_sprite.play("walk-front")
		elif direction.y < 0:
			animated_sprite.play("walk-back")
		elif direction.x > 0:
			animated_sprite.flip_h = false
			animated_sprite.play("walk")
		elif direction.x < 0:
			animated_sprite.flip_h = true
			animated_sprite.play("walk")
		else:
			animated_sprite.play("idle")
		velocity = direction * SPEED 
		move_and_slide()
		PlayerInfo.lastPosition = position
	
func dialogueOn(dialogue) -> void:
	dialogueActive = true

func dialogueOff(dialogue)-> void:
	dialogueActive = false
