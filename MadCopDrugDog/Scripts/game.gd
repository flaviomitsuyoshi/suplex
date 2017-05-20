extends Node

const GRUPO_INIMIGO = "inimigos"
const GRUPO_PLAYER = "player"
const GRUPO_INTERACTION = "interaction"
const GRUPO_TETO = "teto"

const FACE_TREVOR = "res://Sprites/Character/Trevor/Trevor.png"
const FACE_MOTEL_MAN = "res://Sprites/Character/Motel Man/Motel Man.png"

var DIALOG_BOX = false

func _ready():
	pass

func getCamera():
	return get_tree().get_root().get_node("stage").get_node("trevor").get_node("camera")
	pass

func getHUD():
	return get_tree().get_root().get_node("stage").get_node("HUD")

func time_wait(time):
	var t = Timer.new()
	t.set_wait_time(time)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	return t

