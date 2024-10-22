extends Node
class_name StateMachine

var initial_state: State
var states: Dictionary
var current_state: State
var player: MainCharBase

func _init(_player: MainCharBase):
	player = _player
	
	# LIST ALL STATES
	states['walking'] = MainCharWalkingState.new(player)
	states['jumping'] = MainCharJumpingState.new(player)
	states['idle'] = MainCharIdleState.new(player)
	
	for state in states.values():
		state.Transitioned.connect(on_child_transition)

	initial_state = states['idle']

	if initial_state:
		current_state=initial_state
		current_state.enter()
	print_debug("Im ready")

	
func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)
		
func on_child_transition(state, new_state_name):
	print_debug("Transitioning from " + state.name + " to " + new_state_name)
	if state != current_state:
		return

	var new_state = states.get(new_state_name.to_lower())
	if not new_state:
		return
	if current_state:
		current_state.exit()
	new_state.enter()
	current_state = new_state
