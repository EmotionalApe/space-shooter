extends Node2D

var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://Scenes/laser.tscn")

func _ready():
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


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
