extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY =-1000.0
var coin_counter = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 8, SPEED)

	move_and_slide()
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"):
		set_coin(coin_counter + 1)
 # Replace with function body.
		
func set_coin(new_coin_count: int) -> void:
	coin_counter = new_coin_count 
	print("Coins:", coin_counter) # ✅ Move print here
	
