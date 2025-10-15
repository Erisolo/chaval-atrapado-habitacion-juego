extends CanvasLayer

signal on_transition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var wait = 0
var sfx: AudioStream

func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		await get_tree().create_timer(wait/2).timeout
		if sfx != null:
			SoundManager.play_sound(sfx)
		await get_tree().create_timer(wait/2).timeout
		on_transition_finished.emit()
		animation_player.play("fade_from_black")
	elif anim_name == "fade_from_black":
		color_rect.visible = false
		
func transition(seconds: int, audio: AudioStream):
	color_rect.visible = true
	wait = seconds
	sfx = audio
	animation_player.play("fade_to_black")
