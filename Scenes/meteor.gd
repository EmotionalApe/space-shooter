extends Area2D

var speed : int
var direction_x : float
var rotation_speed : int
var can_collide := true

signal collision

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

func _on_body_entered(_body):
	if (can_collide):
		collision.emit()

func _on_area_entered(area):
	area.queue_free()
	$ExplosionPlayer.play()
	can_collide = false
	$Sprite2D.hide()
	await get_tree().create_timer(1).timeout
	queue_free()
