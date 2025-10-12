extends Node2D

@export var chore: String

func _ready() -> void:
	tree_exiting.connect(_exit)
	
func _exit():
	Checklist.getChore(chore).finishCurrentStep()
