extends State
var walking_speed = 10

func map_input_to_speed():
	var input_direction = MultiplayerInput.get_vector(state_owner.device, "movement_left", "movement_right", "movement_up", "movement_down")
	state_owner.velocity = input_direction * walking_speed
	
	if abs(state_owner.velocity.x) > abs(state_owner.velocity.y):
		# If x component is dominant, determine direction along x axis
		if state_owner.velocity.x > 0:
			state_owner.walking_direction = DIRECTIONS.RIGHT
		else:
			state_owner.walking_direction = DIRECTIONS.LEFT
	else:
		# If y component is dominant, determine direction along y axis
		if state_owner.velocity.y > 0:
			state_owner.walking_direction = DIRECTIONS.DOWN
		else:
			state_owner.walking_direction = DIRECTIONS.UP

func choose_animation():
	var dir = state_owner.walking_direction
	if dir == DIRECTIONS.DOWN:
		state_owner.sprite_animations.animation = "front_walking"
	if dir == DIRECTIONS.UP:
		state_owner.sprite_animations.animation = "back_walking"
	if dir == DIRECTIONS.LEFT or dir == DIRECTIONS.RIGHT:
		state_owner.sprite_animations.animation = "side_walking"
	
	# flip image cases
	if dir == DIRECTIONS.LEFT:
		state_owner.sprite_animations.flip_h = true
	if dir == DIRECTIONS.RIGHT:
		state_owner.sprite_animations.flip_h = false
	

func update(_delta: float):
	map_input_to_speed()
	choose_animation()
	if state_owner.velocity.is_equal_approx(Vector2.ZERO):
		emit_signal("Transitioned", self, "idle") 
		
func enter():
	print_debug("Entered walking state")
