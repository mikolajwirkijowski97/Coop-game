extends State
class_name MainCharIdle

func choose_animation():
	var dir = state_owner.walking_direction
	if not state_owner.sprite_animations:
		return
	if dir == DIRECTIONS.DOWN:
		state_owner.sprite_animations.animation = "front_idle"
	if dir == DIRECTIONS.UP:
		state_owner.sprite_animations.animation = "back_idle"
	if dir == DIRECTIONS.LEFT or dir == DIRECTIONS.RIGHT:
		state_owner.sprite_animations.animation = "side_idle"

func enter():
	print_debug("Entered idle state")
	choose_animation()

func update(_delta: float):
	if MultiplayerInput.get_vector(state_owner.device, "movement_left","movement_right","movement_up","movement_down"):
		emit_signal("Transitioned", self, "walking")
