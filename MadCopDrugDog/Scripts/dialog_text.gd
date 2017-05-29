extends RichTextLabel

var dialog = ["Hey! My name is aaa.", "Page 2", "fim"] setget setDialog
var faces = [game.FACE_TREVOR, game.FACE_MOTEL_MAN, game.FACE_TREVOR] setget setFaces
var titles = ["Trevor", "Motel man", "Trevor"] setget setTitles
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	get_owner().get_node("photo").get_texture().load(game.FACE_TREVOR)
	get_owner().get_node("title_label").set_text("Trevor")
	game.DIALOG_BOX = true
	get_tree().set_pause(true)
	print("Criou caixa de dialogo!")

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON && event.is_pressed()) || event.type == Input.is_action_pressed("ui_accept") && !event.is_echo():
		if get_visible_characters() > get_total_character_count():
			
			if page >= dialog.size() - 1:
				get_tree().set_pause(false)
				yield(game.time_wait(0.3), "timeout")
				get_node("../").queue_free()
				game.DIALOG_BOX = false
			
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
				if faces[page] != "" || faces[page] != null:
					get_owner().get_node("photo").get_texture().load(faces[page])
				if titles[page] != "" || titles[page] != null:
					get_owner().get_node("title_label").set_text(titles[page])
		else:
			set_visible_characters(get_total_character_count())
		

func _on_time_timeout():
	set_visible_characters(get_visible_characters() + 1)

############   Não estão sendo usadas   ##############
func expandLabel():
	get_owner().get_node("title_label").set_pos(Vector2(48, 448))
	get_owner().get_node("title_label").set_size(Vector2(928, 30))
	get_owner().set_pos(Vector2(48, 480))
	get_owner().set_size(Vector2(928, 80))
	get_owner().get_node("photo").hide()
func minimizeLabel():
	get_owner().get_node("title_label").set_pos(Vector2(176, 448))
	get_owner().get_node("title_label").set_size(Vector2(800, 30))
	get_owner().set_pos(Vector2(176, 480))
	get_owner().set_size(Vector2(800, 80))
	get_owner().get_node("photo").show()

func setDialog(lista):
	if lista.size() > 0:
		dialog = lista

func setFaces(lista):
	faces = lista

func setTitles(lista):
	titles = lista

