extends State
var walking_speed = 60

func map_input_to_speed(_delta: float):
	var input_direction = MultiplayerInput.get_vector(state_owner.device, "movement_left", "movement_right", "movement_up", "movement_down")

	state_owner.velocity.x = lerp(state_owner.velocity.x, input_direction.x * walking_speed, _delta*10)
	
	if state_owner.velocity.x > 0:
		state_owner.walking_direction = DIRECTIONS.RIGHT
	else:
		state_owner.walking_direction = DIRECTIONS.LEFT

func choose_animation():
	var dir = state_owner.walking_direction
	state_owner.sprite_animations.animation = "run"
	
	# flip image cases
	if dir == DIRECTIONS.LEFT:
		state_owner.sprite_animations.flip_h = true
	if dir == DIRECTIONS.RIGHT:
		state_owner.sprite_animations.flip_h = false
	
func update(_delta: float):
	map_input_to_speed(_delta)
	choose_animation()
	if state_owner.velocity.is_equal_approx(Vector2.ZERO):
		emit_signal("Transitioned", self, "idle") 
		
func enter():
	state_owner.gravity_applies = true
	print_debug("Entered walking state")
