extends Node

var chores: Array[Chore]
var numChores: int

func addChore(newSteps: Array[String]):
	var chore = Chore.new()
	chore.steps = newSteps
	chore.currentStep = 0
