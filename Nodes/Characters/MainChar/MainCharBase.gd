extends CharacterBody2D
class_name MainCharBase

@export var device:int
@onready var sprite_animations: AnimatedSprite2D = $SpriteAnimations

var walking_direction = DIRECTIONS.DOWN
var gravity_applies: bool = true 
var gravity_strength: int = 1000

func _process(delta: float):
	# initialize animations if not playing
	# maybe find a better place for this. 
	if not sprite_animations.is_playing():
		sprite_animations.play()
		
	# falling
	if not is_on_floor() and gravity_applies:
		velocity.y += gravity_strength*delta
	move_and_slide()
	
