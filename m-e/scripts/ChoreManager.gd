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
var taintedScissorsSprite = preload("res://assets/roomObjects/scissorsBloody.png")
# Photos route assets
var photosDialogue = preload("res://Dialogues/Wardrobe.dialogue")
# Ending assets
var endDialogue = preload("res://Dialogues/FinalDialogue.dialogue")
# global variables
var stapplerDialogue = preload("res://Dialogues/Stappler.dialogue")

func _ready() -> void:
	AnimationManager.registerScissors($tijeras/image, $tijeras/image/outline)
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
	
# Siento mucho lo que voy a hacer aquí
func _manage_step(chore: Chore):
	var grappler = $grapadora
	if chore.name == "Hamster":
		var hamster = $hamster
		if chore.currentStep == 0:
			var food = hamsterFood.instantiate()
			food.global_position = Vector2(450, 330)
			add_child(food)
			changeStapplerDialogue("Hamster0")
		elif chore.currentStep == 1:
			remove_child($hamster_food)
			hamster.dialogueStartPoint = "HamsterFeed"
			changeStapplerDialogue("Hamster1")
		elif chore.currentStep == 2:
			hamster.dialogueStartPoint = "CheckOnHamster"
			if !chore.doneOnce[2]:
				DialogueManager.show_dialogue_balloon(hamsterDialogue, "ExitHamsterFeedMinigame")
				chore.doneOnce[2] = true
			changeStapplerDialogue("Hamster2")
		elif chore.currentStep == 3:
			hamster.dialogueStartPoint = "NoHamster"
			changeStapplerDialogue("Hamster3")
			if !chore.doneOnce[3]:
				DialogueManager.show_dialogue_balloon(hamsterDialogue, "EatYourHamster")
				chore.finishCurrentStep()
				chore.doneOnce[3] = true
				PlayerInfo.choresLeft -= 1
				check_num_chores()
			spawnStomachArea()
		elif chore.currentStep == 4:
			hamster.dialogueStartPoint = "NoHamster"
			spawnStomachArea()
	elif chore.name == "InsideYou":
		var teeth = $Teeth
		var mirror = $mirror
		var scissors = $tijeras
		var scissorsSprite = $tijeras/image
		if chore.currentStep == 0:
			if !chore.doneOnce[0]:
				DialogueManager.show_dialogue_balloon(insideYouDialogue)
				chore.doneOnce[0] = true
			var area = $stomach_ache
			remove_child(area)
			var sprite = $Teeth/Sprite2D
			var outline = $Teeth/Sprite2D/Sprite2D
			teeth.dialogueStartPoint = "Pills"
			sprite.texture = pillSprite
			outline.texture = pillOutline
			changeStapplerDialogue("InsideYou0")
		elif chore.currentStep == 1:
			if !chore.doneOnce[1]:
				chore.doneOnce[1] = true
				DialogueManager.show_dialogue_balloon(insideYouDialogue, "StillHurts")
			remove_child(teeth)
			mirror.dialogue = insideYouDialogue
			mirror.dialogueStartPoint = "Mirror"
			changeStapplerDialogue("InsideYou1")
		elif chore.currentStep == 2:
			remove_child(teeth)
			mirror.dialogue = mirrorDialogue
			mirror.dialogueStartPoint = "start"
			scissors.dialogue = insideYouDialogue
			scissors.dialogueStartPoint = "Scissors"
			if !chore.doneOnce[2]:
				DialogueManager.show_dialogue_balloon(insideYouDialogue, "MirrorChecked")
				chore.doneOnce[2] = true
			changeStapplerDialogue("InsideYou2")
		elif chore.currentStep == 3:
			remove_child(teeth)
			scissors.dialogueStartPoint = "ScissorsAfter"
			scissorsSprite.texture = taintedScissorsSprite
			grappler.dialogueStartPoint = "BellyWound"
		elif chore.currentStep == 4:
			grappler.dialogueStartPoint = "InsideYou4"
			if !chore.doneOnce[4]:
				chore.finishCurrentStep()
				PlayerInfo.choresLeft -= 1
				check_num_chores()
				chore.doneOnce[4] = true
			remove_child(teeth)
			scissors.dialogueStartPoint = "ScissorsAfter"
			scissorsSprite.texture = taintedScissorsSprite
		elif chore.currentStep == 5:
			scissors.dialogueStartPoint = "ScissorsAfter"
			scissorsSprite.texture = taintedScissorsSprite
			remove_child(teeth);
	elif chore.name == "Photos":
		var wardrobe = $wardrobe
		if chore.currentStep == 0:
			SceneManager.changeScene("res://scenes/photo_mini_game.tscn")
		elif chore.currentStep == 1:
			changeStapplerDialogue("Photos1")
			wardrobe.dialogueStartPoint = "CheckAgain"
			if !chore.doneOnce[1]:
				DialogueManager.show_dialogue_balloon(photosDialogue, "Solved")
				chore.doneOnce[1] = true
		elif chore.currentStep == 2:
			changeStapplerDialogue("Photos2")
			wardrobe.dialogueStartPoint = "CheckAgainAgain"
			if !chore.doneOnce[2]:
				DialogueManager.show_dialogue_balloon(photosDialogue, "Solved")
				chore.doneOnce[2] = true
		elif chore.currentStep == 3:
			changeStapplerDialogue("Photos3")
			wardrobe.dialogueStartPoint = "Wardrobe"
			if !chore.doneOnce[3]:
				DialogueManager.show_dialogue_balloon(photosDialogue, "AllSolved")
				chore.doneOnce[3] = true
				chore.finishCurrentStep()
				PlayerInfo.choresLeft -= 1
				check_num_chores()
		elif chore.currentStep == 4:
			wardrobe.dialogueStartPoint = "Wardrobe"
	elif chore.name == "End":
		if chore.currentStep == 0:
			var stappler = $grapadora
			stappler.dialogue = endDialogue
			stappler.dialogueStartPoint = "start"
		elif chore.currentStep == 1:
			chore.doneOnce[0] = true
			var bed = $cama
			bed.dialogueStartPoint = "endDialogue"
			
func check_num_chores():
	if PlayerInfo.choresLeft == 0:
		Checklist.addChore("End",["Talk to the stappler", "Go to sleep"])

func changeStapplerDialogue(newDialogue: String):
	var stappler = $grapadora
	if stappler.dialogueStartPoint != "BellyWound":
		stappler.dialogueStartPoint = newDialogue
		
func spawnStomachArea():
	if(Checklist.getChore("InsideYou") == null):
		var area = stomachAcheArea.instantiate()
		area.global_position = Vector2(330, 150)
		add_child(area)
