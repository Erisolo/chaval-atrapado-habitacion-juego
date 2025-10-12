extends Area2D
var dialogue = preload("res://Dialogues/Door.dialogue")
var door = preload("res://prefabs/door.tscn")
var HSprite = preload("res://assets/roomObjects/door.png")
var HOutline = preload("res://assets/roomObjects/doorOutline.png")
var VSprite = preload("res://assets/roomObjects/doorFromUp.png")
var VOutline = preload("res://assets/roomObjects/doorFromUpOutline.png")
var tween
var once = true
var Horizontal = true

@export var Vpositions: Array[Vector2]
@export var Hpositions: Array[Vector2]
@export var timesToSpawn = 4

func _ready() -> void:
	var sprite = $Sprite2D
	var outline = $Sprite2D/Sprite2D2
	
	if Horizontal:
		sprite.texture = HSprite
		outline.texture = HOutline
	else:
		sprite.texture = VSprite
		sprite.position.y = -15
		global_rotation_degrees = 90.0
		outline.texture = VOutline

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") && $Sprite2D/Sprite2D2.visible && once:
		once = false
		tween = create_tween()
		tween.tween_callback(DialogueManager.show_dialogue_balloon.bind(dialogue))
		tween.tween_property($Sprite2D, "modulate:a", 0, 2.0)
		tween.tween_interval(5)
		tween.tween_callback(spawnDoor)
		tween.tween_callback(queue_free)

func spawnDoor():
	if(timesToSpawn == 0):
		return
	timesToSpawn -= 1
	
	var instance = door.instantiate()
	var num
	if Horizontal:
		num = randi() % Vpositions.size()
		instance.global_position = Vpositions[num]
		instance.Horizontal = false
	else:
		num = randi() % Hpositions.size()
		instance.global_position = Hpositions[num]
		instance.Horizontal = true
	
	get_parent().add_child(instance)
