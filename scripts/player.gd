extends CharacterBody2D

const SPEED = 130.0
const MAX_JUMPS = 2
var jump_left = MAX_JUMPS
var has_jumped = false
var JUMP_VELOCITY = -320.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if is_on_floor():
		jump_left = MAX_JUMPS
		has_jumped = false
		JUMP_VELOCITY = -320
	
	if Input.is_action_just_pressed("jump") and jump_left > 0:
		velocity.y = JUMP_VELOCITY
		jump_left -= 1
		JUMP_VELOCITY = -380
		
		if not has_jumped:
			has_jumped = true  
			
	if not is_on_floor() and not has_jumped:
		jump_left = 1
		JUMP_VELOCITY = -380
		
	velocity += get_gravity() * delta
	
	#Get input direction: -1 0 1
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	#Animation player
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	elif not is_on_floor() and jump_left == 0:
		animated_sprite.play("double jump")
	else:
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
