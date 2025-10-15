extends Node

var playerAnim: Node2D
var Scissors: Node2D
var ScissorsOutline: Node2D

func registerPlayerAnimator(p:Node2D):
	playerAnim = p
	
func animPlayer(animation: String):
	if animation == "stab":
		Scissors.visible = false
		ScissorsOutline.visible = false
	playerAnim.play(animation)

func registerScissors(sprite: Node2D, outline: Node2D):
	Scissors = sprite
	ScissorsOutline = outline

func waitForAnimation():
	await playerAnim.animation_finished
	
func makeScissorsVisible():
	Scissors.visible = true
	ScissorsOutline.visible = true
