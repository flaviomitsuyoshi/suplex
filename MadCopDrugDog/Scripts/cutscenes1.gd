extends Node2D

var pre_dialog_box = preload("res://Scenes/dialog_box.tscn")
var pre_dialog_box2 = preload("res://Scenes/dialog_box2.tscn")
var box_num = 0

func _ready():
	get_node("sample").play("siren")
	set_process(true)
	

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		createDialogBox(box_num)

func createDialogBox(num):
	box_num += 1
	if num == 1:
		get_node("sample").play("beep")
		var dialogbox = pre_dialog_box2.instance()
		dialogbox.get_node("text_label").setDialog(["Smith, Johnson, na escuta?", "Sim capitã, qual é o chamado?", "Nós temos um 10-37 no Motel Califórnia. Vivian Scarlet. Preciso de vocês.", "Entendido, estamos indo pra lá."])
		dialogbox.get_node("text_label").setTitles(["Cap. Black", "Trevor", "Cap. Black", "Trevor"])
		add_child(dialogbox)
	elif num == 2:
		yield(game.time_wait(1), "timeout")
		get_tree().change_scene("res://Scenes/Stages/Stage1.tscn")
		#var dialogbox = pre_dialog_box.instance()
		#dialogbox.get_node("text_label").setDialog(["Boa noite!", "O que você quer?", "Vou checar os quartos."])
		#dialogbox.get_node("text_label").setFaces([game.FACE_TREVOR, game.FACE_MOTEL_MAN, ""])
		#dialogbox.get_node("text_label").setTitles(["Trevor", "Dono do Motel", "Trevor"])
		#add_child(dialogbox)