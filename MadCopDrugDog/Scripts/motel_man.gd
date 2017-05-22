extends Area2D

var pre_dialog_box = preload("res://Scenes/dialog_box.tscn")
var ativo = false

func _ready():
	set_process(true)
	pass

func _process(delta):
	if ativo && !game.DIALOG_BOX:
		if Input.is_action_pressed("ui_accept"):
			var dialogbox = pre_dialog_box.instance()
			#dialogbox.set_global_pos(Vector2(0, 0))
			dialogbox.get_node("text_label").setDialog(["Boa noite!", "O que você quer?", "Vou checar os quartos."])
			dialogbox.get_node("text_label").setFaces([game.FACE_TREVOR, game.FACE_MOTEL_MAN, game.FACE_TREVOR])
			dialogbox.get_node("text_label").setTitles(["Trevor", "Dono do Motel", "Trevor"])
			game.getHUD().add_child(dialogbox)
			print("mensagem")

func _on_motel_man_area_enter( area ):
	if area.is_in_group(game.GRUPO_INTERACTION):
		print("Player entrou na area de interação")
		ativo = true


func _on_motel_man_area_exit( area ):
	if area.is_in_group(game.GRUPO_INTERACTION):
		print("Player saiu da area de interação")
		ativo = false
