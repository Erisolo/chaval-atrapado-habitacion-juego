extends Node2D

signal changeScene

@export var objectives: Array[Node2D]
var nObjectives: int

func _ready() -> void:
	nObjectives = objectives.size()
	
	for n in objectives:
		n.wasClicked.connect(_on_objective_clicked)

func _on_objective_clicked():
	nObjectives -= 1
	
	if nObjectives <= 0:
		# Cosas de enhorabuena has ganado
		changeScene.emit("res://scenes/game.tscn")
