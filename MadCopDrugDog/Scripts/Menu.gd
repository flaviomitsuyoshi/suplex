extends Node2D

func _ready():
	pass

func _on_btnStart_pressed():
	get_tree().change_scene("res://Scenes/Stages/Stage1.tscn")
