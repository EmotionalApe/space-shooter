extends Node2D

var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://Scenes/laser.tscn")
func _on_meteor_timer_timeout():
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
