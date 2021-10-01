extends KinematicBody2D

var lado = 1
var vel = Vector2()
var speed = 100
var queda = 1

func _ready():
	$quack.wait_time = rand_range(0.8, 2)
	randomize()
	$movimento.wait_time = rand_range(0.4, 2)
	$anima.wait_time = rand_range(0.6, 1)

func _process(delta):
	#movimentação horizontal
	position.x += speed * lado * delta
	
	#movimentação vertical
	position.y -= 140 * queda * delta
	
	#espelhamento da animação
	if lado < 0:
		$AnimatedSprite.flip_h = true
	else: 
		$AnimatedSprite.flip_h = false 


func _on_movimento_timeout():
	lado = lado*(-1)


func _on_anima_timeout():
	if $AnimatedSprite.animation == "cima":
		$AnimatedSprite.animation = "lado"
		
	elif $AnimatedSprite.animation == "lado":
		$AnimatedSprite.animation = "cima"
		
func mata():
	$AnimatedSprite.animation = "susto"
	$morte.start()


func _on_morte_timeout():
	$quack.stop()
	$AnimatedSprite.animation = "morte"
	queda = -1
	lado = 0


func _on_quack_timeout():
	$audio.play()
