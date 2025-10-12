extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_start_stomach_ache)

func _start_stomach_ache(body: Node2D) -> void:
	Checklist.addChore("InsideYou", ["Take pills", "Check yourself in the mirror", "Use the scissors", "Stapple your wound", ""])
