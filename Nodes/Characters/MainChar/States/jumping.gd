extends State

var jump_timer

func enter():
	jump_timer = 0
	state_owner.sprite_animations.animation = "double_jump"
	state_owner.sprite_animations.play()
	
	state_owner.velocity.y = -450

func exit():
	pass

func physics_update(_delta: float) -> void:
	pass 

func update(_delta: float):
	if state_owner.is_on_floor_only() and jump_timer > 0.1:
		emit_signal("Transitioned",self, "walking")
	jump_timer += _delta
