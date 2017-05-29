########## CLASSE TIRO SIMPLES #########
var intervalo = 0.6
var ultimo_disparo = 0
var player
var pre_tiro = preload("res://Scenes/Objects/bullet.tscn")

func _init(player):
	self.player = player
	pass

func dispara(delta):
	if ultimo_disparo <= 0:
		cria_tiro(player.get_node("posicao_atirar/posicao_tiro"))
		player.get_node("sample").play("gunshot")
		ultimo_disparo = intervalo
	pass

func atualiza(delta):
	if ultimo_disparo > 0:
		ultimo_disparo -= delta
	
func cria_tiro(node):
	var tiro = pre_tiro.instance()
	tiro.set_global_pos(node.get_global_pos())
	tiro.set_global_rot(player.get_global_rot())
	player.get_owner().add_child(tiro)