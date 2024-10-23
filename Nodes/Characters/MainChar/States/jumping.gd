extends State
class_name MainCharJumpingState

var jump_timer = 0
var jumping_movement_speed = 100

func enter():
	jump_timer = 0
	player.sprite_animations.animation = "double_jump"
	player.sprite_animations.play()

	player.velocity.y = -450
	player.velocity.x *= 1.1

func exit():
	pass

func physics_update(_delta: float) -> void:
	pass 

func _update(_delta: float):
	if player.velocity.y > 0:
		emit_signal("Transitioned", self, "falling")
		return
	jump_timer += _delta
	player_controller.apply_horizontal_movement(jumping_movement_speed, _delta)
