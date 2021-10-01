extends Node2D

var patosnatela
var pato = preload("res://Pato.tscn")

var flyaway = 0
var capturados = 0
func _ready():
	$gerapato.start()

func _process(delta):
	$HUD/Label.text = str(capturados)
	
	$Alvo.position.x = get_local_mouse_position().x
	$Alvo.position.y = get_local_mouse_position().y
	


func nasce():
	var novop = pato.instance()
	add_child(novop)
	novop.position.x = rand_range(50, 700)
	novop.position.y = 700

func _on_gerapato_timeout():
	patosnatela = int(rand_range(1, 6))
	for n in patosnatela:
		nasce()


func _on_espera_timeout():
	$round.play()
	$gerapato.start()
	


func _on_topo_body_entered(body):
	$flyaway.play()
	flyaway = 1
	patosnatela -= 1
	atualizaturno()


func _on_chao_body_entered(body):
	$colidiu.play()
	capturados += 1
	patosnatela -= 1
	atualizaturno()
	
func atualizaturno():
	if patosnatela == 0:
		$espera.start()
		if flyaway == 1:
			$cao.play("rindo")
			$cao_rindo.play()
			flyaway = 0
			capturados = 0
		else:
			$cao.play("captura")
			$cao_captura.play()
