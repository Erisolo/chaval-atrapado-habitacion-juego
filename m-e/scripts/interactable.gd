extends Node2D
@export var collison_area: Area2D
var isIn = false
@export var dialogue : DialogueResource
@export var dialogueStartPoint = "start"
var dialogueActive = false

signal DialogueEnded

func _ready() -> void:
	DialogueManager.dialogue_started.connect(dialogueOn)
	DialogueManager.dialogue_ended.connect(dialogueOff)
	collison_area.body_entered.connect(_on_area_2d_body_entered)
	collison_area.body_exited.connect(_on_area_2d_body_exited)
	
func _input(event: InputEvent) -> void:
	if isIn && event.is_action_pressed("Interact") && not dialogueActive:
		DialogueManager	.show_dialogue_balloon(dialogue, dialogueStartPoint)
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	isIn = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	isIn = false

func dialogueOn(dialogue) -> void:
	dialogueActive = true

func dialogueOff(dialogue)-> void:
	dialogueActive = false
	DialogueEnded.emit()
