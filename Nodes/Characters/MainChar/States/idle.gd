extends State
class_name MainCharIdleState

func play_animation():
	if not player.sprite_animations:
		return
	player.sprite_animations.animation = "idle"
	player.sprite_animations.play()

func enter():
	player_controller.gravity_applies = true
	print_debug("Entered idle state")
	play_animation()

func _update(_delta: float):
	if not player.sprite_animations.is_playing():
			play_animation()
	if MultiplayerInput.get_vector(player_controller.device, "movement_left","movement_right","movement_up","movement_down"):
		emit_signal("Transitioned", self, "walking")
