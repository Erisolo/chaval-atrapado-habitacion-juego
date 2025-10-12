extends Node2D

@export var chore: String
@export var winCond: Node
var win = false

func _ready() -> void:
	tree_exiting.connect(_exit)
	winCond.win.connect(win_cond_met)
	
func _exit():
	if win:
		Checklist.getChore(chore).finishCurrentStep()
		
func win_cond_met():
	win = true
