extends RichTextLabel

var dialog = ["Hey! aaaa1  aa dd a a a.", "Nº 2. asd asd adsad a", "end. adssad sasda"] setget setDialog
var titles = ["Trevor", "Motel man", "Trevor"] setget setTitles
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	get_owner().get_node("title_label").set_text(titles[page])
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
				if titles[page] != "" || titles[page] != null:
					get_owner().get_node("title_label").set_text(titles[page])
		else:
			set_visible_characters(get_total_character_count())

func _on_timer_timeout():
	set_visible_characters(get_visible_characters() + 1)

func setDialog(lista):
	if lista.size() > 0:
		dialog = lista

func setTitles(lista):
	titles = lista
