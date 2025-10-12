extends Node

var chores: Array[Chore]
var numChores = 0

signal ChoreAdded

func addChore(Name: String, newSteps: Array[String]):
	if(getChore(Name) != null):
		return
	var chore = Chore.new()
	chore.name = Name
	chore.steps = newSteps
	chore.currentStep = 0
	chores.append(chore)
	numChores += 1
	ChoreAdded.emit()

func getChore(Name: String) -> Chore:
	var myChore: Chore
	for n in chores:
		if n.name == Name:
			myChore = n
	return myChore
