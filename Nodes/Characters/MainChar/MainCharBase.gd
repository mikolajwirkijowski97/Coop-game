extends CharacterBody2D
class_name MainCharBase

@onready var sprite_animations: AnimatedSprite2D = $SpriteAnimations
var walking_direction = DIRECTIONS.DOWN

func _process(delta: float):
	move_and_slide()