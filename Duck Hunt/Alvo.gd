extends Area2D

var patoatual

func _ready():
	pass


func _on_Alvo_body_entered(body):
	patoatual = body
	
func _input(event):
	if Input.is_action_just_pressed("atirar"):
		$AudioStreamPlayer2D.play()
		if patoatual == null:
			print("sem patos por aqui")
		else: 
			patoatual.mata()
