extends State
var walking_speed = 10

func map_input_to_speed():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	state_owner.velocity = input_direction * walking_speed
	
	if state_owner.velocity.x > 0:
		state_owner.walking_direction = DIRECTIONS.RIGHT
	if state_owner.velocity.x < 0:
		state_owner.walking_direction = DIRECTIONS.LEFT
	if state_owner.velocity.y < 0:
		state_owner.walking_direction = DIRECTIONS.UP
	if state_owner.velocity.y > 0:
		state_owner.walking_direction = DIRECTIONS.DOWN

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
	print("Entered walking state")
