extends State
var walking_speed = 180

func map_input_to_speed(_delta: float):
	var input_direction = MultiplayerInput.get_vector(state_owner.device, "movement_left", "movement_right", "movement_up", "movement_down")
	state_owner.velocity.x = lerp(state_owner.velocity.x, input_direction.x * walking_speed, _delta*30)
	
	if state_owner.velocity.x > 0:
		state_owner.walking_direction = DIRECTIONS.RIGHT
	else:
		state_owner.walking_direction = DIRECTIONS.LEFT

func choose_animation():
	var dir = state_owner.walking_direction
	state_owner.sprite_animations.animation = "run"
	if not state_owner.sprite_animations.is_playing():
		print_debug("Playing animation")
		state_owner.sprite_animations.play()
		
	# flip image cases
	if dir == DIRECTIONS.LEFT:
		state_owner.sprite_animations.flip_h = true
	if dir == DIRECTIONS.RIGHT:
		state_owner.sprite_animations.flip_h = false
	
func update(_delta: float):
	map_input_to_speed(_delta)
	choose_animation()
	
	# Exit condition
	if abs(state_owner.velocity.x) < 0.2:
		emit_signal("Transitioned", self, "idle") 
	# Transition to jump
	if MultiplayerInput.is_action_just_pressed(state_owner.device, "jump"):
		emit_signal("Transitioned", self, "jumping")
		
func enter():
	state_owner.gravity_applies = true
	print_debug("Entered walking state")
