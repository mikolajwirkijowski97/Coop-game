extends State
class_name MainCharFallingState

var falling_x_speed: float = 100

func play_animation():
	if not player.sprite_animations:
		return
	player.sprite_animations.animation = "fall"
	player.sprite_animations.play()

func enter():
	player_controller.gravity_applies = true
	print_debug("Entered falling state")
	play_animation()

func _update(_delta: float):
	player_controller.apply_horizontal_movement(falling_x_speed, _delta)
	if player.is_on_floor():
		emit_signal("Transitioned", self, "walking")
