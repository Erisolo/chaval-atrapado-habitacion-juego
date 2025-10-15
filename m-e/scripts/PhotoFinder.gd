extends Node2D

signal changeScene
const BOOM = preload("uid://ddntidanqd3jv")

@export var objectives: Array[Node2D]
var nObjectives: int

func _ready() -> void:
	nObjectives = objectives.size()
	
	for n in objectives:
		n.wasClicked.connect(_on_objective_clicked)

func _on_objective_clicked():
	nObjectives -= 1
	SoundManager.play_sound(BOOM)
	
	if nObjectives <= 0:
		Checklist.getChore("Photos").finishCurrentStep()
		changeScene.emit("res://scenes/game.tscn")
