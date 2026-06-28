extends CanvasLayer

var image = load("res://Assets/PNG/UI/playerLife2_orange.png")
var timeElapsed := 1

func set_health(health):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	for i in range(health):
		var life = TextureRect.new()
		life.texture = image
		life.expand_mode=TextureRect.EXPAND_KEEP_SIZE
		$MarginContainer2/HBoxContainer.add_child(life)


func _on_score_timer_timeout():
	timeElapsed += 1
	Global.score = timeElapsed
	$MarginContainer/Label.text = str(timeElapsed)
