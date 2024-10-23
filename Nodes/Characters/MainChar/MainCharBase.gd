extends CharacterBody2D
class_name MainCharBase

@onready var sprite_animations: AnimatedSprite2D = $SpriteAnimations
var state_machine
var player_controller

func _init():
	player_controller = PlayerController.new(self)
	state_machine = StateMachine.new(self)
	add_child(state_machine)
	add_child(player_controller)
	print_debug("I've been initialized!")

func _ready():
	print_debug("Im ready")
