extends Resource

class_name Chore

@export var steps: Array[String]
@export var currentStep: int

signal stepCompleted

func finishCurrentChore():
	stepCompleted.emit(currentStep)
	currentStep = currentStep + 1
