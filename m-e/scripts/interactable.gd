extends RigidBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
var isIn = false
const TEST_DIALOGUE = preload("uid://cktesfjwl7ytt")
var dialogueActive = false

func _ready() -> void:
	DialogueManager.dialogue_started.connect(dialogueOn)
	DialogueManager.dialogue_ended.connect(dialogueOff)
	
func _input(event: InputEvent) -> void:
	if isIn && event.is_action_pressed("Interact") && not dialogueActive:
		DialogueManager	.show_dialogue_balloon(TEST_DIALOGUE, "start")

func _on_area_2d_body_entered(body: Node2D) -> void:
	isIn = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	isIn = false

func dialogueOn(dialogue) -> void:
	dialogueActive = true

func dialogueOff(dialogue)-> void:
	dialogueActive = false
