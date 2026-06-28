extends Node2D

var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://Scenes/laser.tscn")

var health := 3

func _ready():
	get_tree().call_group('ui', 'set_health', health)
	
	var children = $Stars.get_children()
	var rng = RandomNumberGenerator.new()
	var screenSize = get_viewport().get_visible_rect().size
	for child in children : 
		var randomX = rng.randi_range(0, screenSize[0])
		var randomY = rng.randi_range(0, screenSize[1])
		child.position = Vector2(randomX, randomY)
		var randomScale = rng.randf_range(0.3, 1.2)
		child.scale = Vector2(randomScale, randomScale)
		child.speed_scale = rng.randf_range(0.6, 1.4)
		

func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)
	meteor.connect("collision", _on_meteor_collision)

func _on_meteor_collision():
	$Player.play_damage_sound()
	health -= 1
	get_tree().call_group('ui', 'set_health', health)
	if (health <= 0):
		call_deferred('change_to_game_over')
		

func change_to_game_over():
	get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
