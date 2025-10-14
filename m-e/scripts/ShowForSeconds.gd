extends Sprite2D

@export var Scene: String
@export var chore: String
@export var animator: AnimatedSprite2D
signal button_pressed;

func _process(_delta) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		button_pressed.emit()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await self.button_pressed
	animator.play("eye")
	await self.button_pressed
	Checklist.getChore(chore).finishCurrentStep()
	SceneManager.changeScene(Scene)
