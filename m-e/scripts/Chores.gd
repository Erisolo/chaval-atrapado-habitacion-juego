extends Resource

class_name Chore

@export var name: String
@export var steps: Array[String]
@export var currentStep: int

signal stepCompleted

func finishCurrentStep():
	currentStep = currentStep + 1
	stepCompleted.emit(self)
	print("Chore ", name, ": Has completado la tarea numero ", currentStep-1, ": ", steps[currentStep-1])
