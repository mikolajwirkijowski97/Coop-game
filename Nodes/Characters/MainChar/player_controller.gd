extends Node
class_name PlayerController

# device is associated with player_id as it shares all properties
var device: int
var has_device: bool = false

var player: MainCharBase
var direction = DIRECTIONS.DOWN
var gravity_applies: bool = true 
var gravity_strength: int = 1000

func _init(_player: MainCharBase):
	player = _player
	
func _ready():
	MainPlayerManager.player_joined.connect(on_player_joined)
	MainPlayerManager.player_left.connect(on_player_left)
	print_debug("Im ready")

func _process(delta):
	apply_falling(delta)
	handle_direction_setting()
	handle_sprite_flipping()
	player.move_and_slide()

func handle_sprite_flipping():
	if direction == DIRECTIONS.LEFT:
		player.sprite_animations.flip_h = true
	else:
		player.sprite_animations.flip_h = false

func handle_direction_setting():
	if player.velocity.x > 0:
		direction = DIRECTIONS.RIGHT
	else:
		direction = DIRECTIONS.LEFT
	
func apply_falling(_delta:float):
	if not player.is_on_floor() and gravity_applies:
		player.velocity.y += gravity_strength*_delta

func apply_horizontal_movement(speed: float, _delta: float):
	if device < -1:
		return

	var input_direction = MultiplayerInput.get_vector(device, "movement_left", "movement_right", "movement_up", "movement_down")
	player.velocity.x = lerp(player.velocity.x, input_direction.x * speed, _delta*30)
	
func on_player_joined(_player):
	if _player == device:
		has_device = true

func on_player_left(_player):
	if _player == device:
		has_device = false
