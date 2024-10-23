extends Node2D
class_name base_level

var players: Array
var player_scenes: Array = [preload("res://Nodes/Characters/MainChar/main_char_base.tscn"), preload("res://Nodes/Characters/MainChar/main_char_dog.tscn")]
func _ready():
	spawn_players()
	
func _process(delta):
	MainPlayerManager.handle_join_input()
	
func spawn_players():
	for i in 2:
		players.append(player_scenes[i].instantiate())
		players[i].position = Vector2(i*30, 0)
		players[i].player_controller.device = i
		add_child(players[i])

	
