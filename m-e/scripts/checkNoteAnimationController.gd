extends CanvasLayer
signal button_pressed;
@onready var checknote = $TextureRect
@onready var animationplayer = $AnimationPlayer
var label

func _ready() -> void:
	checknote.visible = false;
	label = checknote.get_child(1)
	
func _process(_delta) -> void:
	if checknote.visible && Input.is_action_just_pressed("ui_accept"):
		button_pressed.emit()
		
#es un poko guarrada pero me la pela
func showChores():
	checknote.visible = true
	var _text = ""
	for i in Checklist.chores:
		if i.currentStep < i.steps.size() :
			_text += i.steps[i.currentStep] + "\n"
	label.text = _text
	animationplayer.play("jump_in")
	await animationplayer.animation_finished
	await button_pressed
	animationplayer.play("jump-out")
	await animationplayer.animation_finished
	checknote.visible = false;
	
