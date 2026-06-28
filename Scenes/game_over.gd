extends Control

func _ready():
	$CenterContainer/VBoxContainer/Label2.text += str(Global.score)

func _process(_delta):
	if (Input.is_action_just_pressed('shoot')):
		get_tree().change_scene_to_file("res://Scenes/level.tscn")
