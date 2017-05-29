extends Area2D

var vel = 500
var dano = 1

func _ready():
	set_process(true)
	print("cria tiro")


func _process(delta):
	set_pos(get_pos() + Vector2(0, -1) * vel * delta)


func _on_area_body_enter( body ):
	queue_free()
	print("destroi tiro - body")
