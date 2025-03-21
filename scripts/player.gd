extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var coin_count = 0

func add_coin():
	coin_count += 1
	print("Current Coin: ", coin_count)

func coin_total():
	print("Total Coin: ", coin_count)

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
