extends Area2D

@onready var hud = $"../../CanvasLayer/HUD"
@onready var animation_player = $AnimationPlayer
func _on_body_entered(body: Node2D) -> void:
	hud.add_coin()
	animation_player.play("PickUpAnimation")
