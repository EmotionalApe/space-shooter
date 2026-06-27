extends CharacterBody2D
@export var speed : int = 500
signal laser(pos) 

var canShoot:bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(400, 500)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if (Input.is_action_just_pressed("shoot") and canShoot) :
		laser.emit($LaserStartPos.global_position)
		canShoot = false
		$canShootTimer.start()


func _on_can_shoot_timeout():
	canShoot = true
