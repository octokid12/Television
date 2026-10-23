extends Node2D



func _ready() -> void:
	await get_tree().create_timer(5).timeout
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Values.PlayerY > position.y:
		z_index = 0
	else:
		z_index = 1


func _on_area_2d_area_entered(_area: Area2D) -> void:
	await get_tree().create_timer(0.2).timeout
	queue_free()
