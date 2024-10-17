extends State
class_name MainCharIdle

func choose_animation():
	if not state_owner.sprite_animations:
		return

	state_owner.sprite_animations.animation = "idle"
	state_owner.sprite_animations.play()

func enter():
	state_owner.gravity_applies = true
	print_debug("Entered idle state")
	choose_animation()

func update(_delta: float):
	if not state_owner.sprite_animations.is_playing():
			choose_animation()
	if MultiplayerInput.get_vector(state_owner.device, "movement_left","movement_right","movement_up","movement_down"):
		emit_signal("Transitioned", self, "walking")
