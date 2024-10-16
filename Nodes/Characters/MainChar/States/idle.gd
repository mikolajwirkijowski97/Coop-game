extends State
class_name MainCharIdle

func choose_animation():
	if not state_owner.sprite_animations:
		return

	state_owner.sprite_animations.animation = "idle"

func enter():
	print_debug("Entered idle state")
	choose_animation()

func update(_delta: float):
	if MultiplayerInput.get_vector(state_owner.device, "movement_left","movement_right","movement_up","movement_down"):
		emit_signal("Transitioned", self, "walking")
