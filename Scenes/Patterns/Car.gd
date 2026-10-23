extends DangerousObject
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2.5).timeout
	$"../Warning".modulate = "ff0000"
	await get_tree().create_timer(0.5).timeout
	moving = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if moving:
		position.y += 75
		if position.y > 1000:
			$"..".queue_free()
