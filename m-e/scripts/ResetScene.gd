extends Node2D
@export var finish: Array[Node]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in finish:
		n.changeScene.connect(changeScene)
	
func changeScene(new_scene: String):
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file(new_scene)
