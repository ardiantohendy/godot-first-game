extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@export var stompable: bool = true

func _on_stomped():
	# Efek ketika diinjak (bisa diubah jadi animasi atau efek lain)
	queue_free() 

func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * SPEED * delta
