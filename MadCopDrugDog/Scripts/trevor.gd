extends KinematicBody2D

export var MOTION_SPEED = 140
var vel = 140
var nova_anima = ""
var animacao = ""
var shooter = false

func _ready():
	add_to_group(game.GRUPO_PLAYER)
	get_node("interaction_area").add_to_group(game.GRUPO_INTERACTION)
	set_fixed_process(true)

func _fixed_process(delta):
	var motion = Vector2()
	
	#motion
	var walking = false
	var shooter = false
	
	if Input.is_action_pressed("shooter"):
		shooter = true
	
	if (!shooter):
		if (Input.is_action_pressed("ui_up")):
			motion += Vector2(0, -1)
			walking = true
		
		if (Input.is_action_pressed("ui_down")):
			motion += Vector2(0, 1)
			walking = true
		
		if (Input.is_action_pressed("ui_left")):
			motion += Vector2(-1, 0)
			walking = true
			
		if (Input.is_action_pressed("ui_right")):
			motion += Vector2(1, 0)
			walking = true
			
	
	if (Input.is_action_pressed("ui_up")):
		set_rotd(0)
	if (Input.is_action_pressed("ui_down")):
		set_rotd(180)
	if (Input.is_action_pressed("ui_left")):
		set_rotd(90)
	if (Input.is_action_pressed("ui_right")):
		set_rotd(-90)
	
	if (Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_left")):
		set_rotd(45)
	if (Input.is_action_pressed("ui_up") && Input.is_action_pressed("ui_right")):
		set_rotd(-45)
	if (Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_left")):
		set_rotd(-225)
	if (Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_right")):
		set_rotd(225)
	
	if shooter:
		nova_anima = "shoot"
	elif (walking):
		nova_anima = "walk"
	elif (!walking && !shooter):
		nova_anima = "idle"
	
	if (animacao != nova_anima):
		get_node("anim").play(nova_anima)
		print(nova_anima)
		animacao = nova_anima
	
	motion = motion.normalized() * MOTION_SPEED * delta
	move(motion)
	#set_pos(get_pos() + motion)
