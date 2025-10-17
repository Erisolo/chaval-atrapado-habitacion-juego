extends Node2D
@export var yLimit: int
@onready var sprite_2d: Sprite2D = $Sprite2D
@export var winNode: Node2D

var isWatching = true
var iSawYou = false
var win = false
signal changeScene;
const music = preload("uid://nsi28i61k28o")
const cronch = preload("uid://cgxkphu2alp0b")


func _ready() -> void:
	winNode.win.connect(youWin)
	sprite_2d.imWatching.connect(changeActiveWatching)
	SoundManager.stop_music(1)
	SoundManager.play_music(music, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isWatching && Input.is_action_pressed("Up") && !iSawYou && !win:
		SceneManager.changeScene("res://scenes/minigame_testing.tscn", 1.5)
		SoundManager.stop_music()
		#SoundManager.play_sound(cronch)
		iSawYou = true

func changeActiveWatching() -> void:
	isWatching = !isWatching

func youWin():
	win = true
