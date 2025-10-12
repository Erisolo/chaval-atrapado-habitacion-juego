extends CanvasLayer
signal button_pressed;
@onready var checknote = $TextureRect
@onready var animationplayer = $AnimationPlayer

func _ready() -> void:
	checknote.visible = false;
	
func _process(_delta) -> void:
	if checknote.visible && Input.is_action_just_pressed("ui_accept"):
		button_pressed.emit()
		
#es un poko guarrada pero me la pela
func showChores():
	checknote.visible = true
	animationplayer.play("jump_in")
	await animationplayer.animation_finished
	await button_pressed
	animationplayer.play("jump-out")
	await animationplayer.animation_finished
	checknote.visible = false;
	
