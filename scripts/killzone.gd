extends Area2D

@onready var timer = $Timer
#YG di bawah ini pake node -> groups dan buat global group/ 
#dengan ini Tidak bergantung pada struktur node dan Tetap bisa 
#menemukan HUD meskipun path berubah atau Enemy berpindah ke scene lain.
@onready var hud = get_tree().get_first_node_in_group("HUD")


func _on_body_entered(body: Node2D) -> void:	
	
	if body.is_in_group("player"):
		if body.velocity.y > 0:
			get_parent().queue_free() 
			body.velocity.y = -300 
		else:
			print("YOU DIED!")
			Engine.time_scale = 0.5
			hud.coin_total()
			body.get_node("CollisionShape2D").queue_free()
			timer.start()

func _on_timer_timeout() -> void:
	print("Restarting game...")
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
