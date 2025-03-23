extends Area2D

@onready var timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("You Kill 1 Slime + 1 Coin...")
