extends Node2D

# Initial Dialogue
var initialDialogue = preload("res://Dialogues/WakeUp.dialogue")
# Hamster route assets
var hamsterFood = preload("res://prefabs/hamster_food.tscn")
var hamsterDialogue = preload("res://Dialogues/HamsterDilogues.dialogue")
# InsideYou route assets
var stomachAcheArea = preload("res://prefabs/stomach_ache.tscn")
var insideYouDialogue = preload("res://Dialogues/InsideYouDialogues.dialogue")
var pillSprite = preload("res://assets/roomObjects/pills.png")
var pillOutline = preload("res://assets/roomObjects/pillsOutline.png")
var pillDialogue = preload("res://Dialogues/InsideYouDialogues.dialogue")
var mirrorDialogue = preload("res://Dialogues/mirror.dialogue")
# Photos route assets
var photosDialogue = preload("res://Dialogues/Wardrobe.dialogue")

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
	var grappler = $grapadora
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
			chore.finishCurrentStep()
	elif chore.name == "InsideYou":
		var teeth = $Teeth
		var mirror = $mirror
		var scissors = $tijeras
		if chore.currentStep == 0:
			DialogueManager.show_dialogue_balloon(insideYouDialogue)
			var area = $stomach_ache
			remove_child(area)
			var sprite = $Teeth/Sprite2D
			var outline = $Teeth/Sprite2D/Sprite2D
			teeth.dialogueStartPoint = "Pills"
			sprite.texture = pillSprite
			outline.texture = pillOutline
		elif chore.currentStep == 1:
			remove_child(teeth)
			DialogueManager.show_dialogue_balloon(insideYouDialogue, "StillHurts")
			mirror.dialogue = insideYouDialogue
			mirror.dialogueStartPoint = "Mirror"
		elif chore.currentStep == 2:
			mirror.dialogue = mirrorDialogue
			mirror.dialogueStartPoint = "start"
			scissors.dialogue = insideYouDialogue
			scissors.dialogueStartPoint = "Scissors"
			DialogueManager.show_dialogue_balloon(insideYouDialogue, "MirrorChecked")
		elif chore.currentStep == 3:
			scissors.dialogueStartPoint = "NormalScissors"
			grappler.dialogueStartPoint = "BellyWound"
		elif chore.currentStep == 4:
			grappler.dialogueStartPoint = "start"
			chore.finishCurrentStep()
	elif chore.name == "Photos":
		var wardrobe = $wardrobe
		if chore.currentStep == 0:
			SceneManager.changeScene("res://scenes/photo_mini_game.tscn")
		elif chore.currentStep == 1:
			wardrobe.dialogueStartPoint = "CheckAgain"
			DialogueManager.show_dialogue_balloon(photosDialogue, "Solved")
		elif chore.currentStep == 2:
			wardrobe.dialogueStartPoint = "CheckAgainAgain"
			DialogueManager.show_dialogue_balloon(photosDialogue, "Solved")
		elif chore.currentStep == 3:
			wardrobe.dialogueStartPoint = "Wardrobe"
			DialogueManager.show_dialogue_balloon(photosDialogue, "AllSolved")
			chore.finishCurrentStep()
