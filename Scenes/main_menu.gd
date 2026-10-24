extends Node2D

var TutorialOpen: bool = false


func _ready() -> void:
	get_tree().paused = false


func _on_play_normal_pressed() -> void:
	print("hai")
	Values.endless = false
	Values.LoadableScene = Values.Levels[Values.Level]
	get_tree().change_scene_to_file("res://Scenes/loading.tscn")


func _on_play_endless_pressed() -> void:
	Values.endless = true
	Values.LoadableScene = "res://Scenes/Endless/Endless.tscn"
	get_tree().change_scene_to_file("res://Scenes/loading.tscn")


func _on_how_2_play_pressed() -> void:
	if not TutorialOpen:
		$HowToPlay.visible = true


func _on_close_pressed() -> void:
	$HowToPlay.visible = false
