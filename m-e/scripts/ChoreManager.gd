extends Node2D

# Initial Dialogue
var initialDialogue = preload("res://Dialogues/WakeUp.dialogue")
# Hamster route assets
var hamsterFood = preload("res://prefabs/hamster_food.tscn")
var hamsterDialogue = preload("res://Dialogues/HamsterDilogues.dialogue")
# InsideYou route assets
var stomachAcheArea = preload("res://prefabs/stomach_ache.tscn")
var insideYouDialogue = preload("res://Dialogues/InsideYouDialogues.dialogue")

func _ready() -> void:
	Checklist.ChoreAdded.connect(_add_chore_listener)
	for n in Checklist.chores:
		n.stepCompleted.connect(_manage_step)
		_manage_step(n)
	if PlayerInfo.isFirstTime:
		PlayerInfo.isFirstTime = false
		PlayerInfo.position = Vector2(0, 0)
		DialogueManager.show_dialogue_balloon(initialDialogue)
	
func _add_chore_listener():
	var chore = Checklist.chores[Checklist.numChores - 1]
	chore.stepCompleted.connect(_manage_step)
	_manage_step(chore)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Hamster3"):
		var chore = Checklist.getChore("Hamster")
		chore.currentStep = 3
		_manage_step(chore)

# Siento mucho lo que voy a hacer aquí
func _manage_step(chore: Chore):
	if chore.name == "Hamster":
		var hamster = $hamster
		if chore.currentStep == 0:
			var food = hamsterFood.instantiate()
			food.global_position = Vector2(450, 330) 
			add_child(food)
		elif chore.currentStep == 1:
			remove_child($hamster_food)
			hamster.dialogueStartPoint = "HamsterFeed"
		elif chore.currentStep == 2:
			hamster.dialogueStartPoint = "CheckOnHamster"
			DialogueManager.show_dialogue_balloon(hamsterDialogue, "ExitHamsterFeedMinigame")
		elif chore.currentStep == 3:
			hamster.dialogueStartPoint = "NoHamster"
			DialogueManager.show_dialogue_balloon(hamsterDialogue, "EatYourHamster")
			if(Checklist.getChore("InsideYou") == null):
				var area = stomachAcheArea.instantiate()
				area.global_position = Vector2(330, 150)
				add_child(area)
	elif chore.name == "InsideYou":
		if chore.currentStep == 0:
			DialogueManager.show_dialogue_balloon(insideYouDialogue)
			# Hacer que los dientes sean pastillas
