extends Node2D
@export var yLimit: int
@onready var sprite_2d: Sprite2D = $Sprite2D

var isWatching = true
var iSawYou = false
signal changeScene;

func _ready() -> void:
	sprite_2d.imWatching.connect(changeActiveWatching)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isWatching && Input.is_action_pressed("Up") && !iSawYou:
		SceneManager.changeScene("res://scenes/minigame_testing.tscn")
		iSawYou = true

func changeActiveWatching() -> void:
	isWatching = !isWatching
