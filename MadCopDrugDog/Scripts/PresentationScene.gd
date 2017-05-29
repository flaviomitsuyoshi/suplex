extends Node

func _ready():
	print("Passou pela Presentation")
	
	yield(game.time_wait(3), "timeout")
	
	get_tree().change_scene("res://Scenes/Stages/Menu.tscn")
	pass
