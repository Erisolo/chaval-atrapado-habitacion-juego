extends Sprite2D

@export var seconds: int
@export var Scene: String
@export var chore: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(seconds).timeout
	Checklist.getChore(chore).finishCurrentStep()
	SceneManager.changeScene(Scene)
