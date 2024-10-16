extends CharacterBody2D
class_name MainCharBase

@export var device:int
@onready var sprite_animations: AnimatedSprite2D = $SpriteAnimations
var walking_direction = DIRECTIONS.DOWN


func _process(delta: float):
	if not sprite_animations.is_playing():
		sprite_animations.play()
	move_and_slide()
	
