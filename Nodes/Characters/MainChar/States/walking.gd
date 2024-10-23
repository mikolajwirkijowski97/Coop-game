extends State
class_name MainCharWalkingState
var walking_speed = 180

func play_animation():
	player.sprite_animations.animation = "run"
	if not player.sprite_animations.is_playing():
		player.sprite_animations.play()
	
func _update(_delta: float):
	play_animation()
	player_controller.apply_horizontal_movement(walking_speed, _delta)

	# Transition condition from walking to idle 
	if abs(player.velocity.x) < 0.2:
		emit_signal("Transitioned", self, "idle") 
	
	# Transition condition from walking to jump
	if MultiplayerInput.is_action_just_pressed(player_controller.device, "jump"):
		emit_signal("Transitioned", self, "jumping")
		
func enter():
	#player_controller.gravity_applies = true
	print_debug("Entered walking state")
