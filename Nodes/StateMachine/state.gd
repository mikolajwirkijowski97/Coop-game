extends Node
class_name State

@onready var player: MainCharBase
@onready var player_controller: PlayerController
signal Transitioned

func _init(_player: MainCharBase):
	player = _player
	player_controller = player.player_controller

func enter():
	pass

func exit():
	pass

func _ready():
	print_debug("Im ready")

func physics_update(_delta: float) -> void:
	pass 

func update(_delta: float):
	if player and player_controller.has_device:
		_update(_delta)

func _update(_delta: float):
	pass
