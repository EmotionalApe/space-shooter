extends Area2D

var speed : int
var direction_x : float
var rotation_speed : int

func _ready():
	var rng = RandomNumberGenerator.new()
	var path = "res://Assets/PNG/Meteors/" + str(rng.randi_range(1,6)) + ".png"
	$Sprite2D.texture = load(path)
	var width = get_viewport().get_visible_rect().size[0]
	var randomX = rng.randi_range(0, width)
	var randomY = rng.randi_range(-150, -50)
	position = Vector2(randomX, randomY)
	
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)
	
func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body):
	print("body entered ", body)
