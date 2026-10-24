extends CanvasLayer

@onready var timer = $Timer
@onready var Labeltime = $Time/Time2

var Paused: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Values.endless:
		$Target.visible = false
		timer.start()
		Values.TargetScore = Values.EndlesHi
	else:
		timer.wait_time = Values.Timers[Values.Level]
		Values.TargetScore = Values.Targets[Values.Level]
		timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("Pause"):
		if not Paused:
			$Pause.visible = true
			get_tree().paused = true
			Paused = true
			print("pause")
		else:
			print("unpause")
			Paused = false
			$Pause.visible = false
			get_tree().paused = false
	
	if Values.Score >= int($Target/TargetScore.text):
		$Score.modulate = "ffe945"
	else:
		$Score.modulate = "ffffff"
	
	
	$Score.text = str(Values.Score)
	$Mult.text = str(Values.Mult)
	Labeltime.text = "%02d" % Time_Left()
	
	
	
func Time_Left():
	var time_left = timer.time_left
	var minui = floor(time_left)
	return minui


func _on_timer_timeout() -> void:
	$AnimationPlayer.play("End")
	get_tree().set_pause(true)
	await get_tree().create_timer(3).timeout
	
	if Values.Score > Values.Highscores[Values.Level]:
		Values.Highscores[Values.Level] = Values.Score
	
	
	if not Values.endless:
		if Values.Score < Values.TargetScore:
			Values.Won = -1
			Values.LoadableScene = get_tree().current_scene.scene_file_path
			get_tree().paused = false
			Transitions.play("Trianglewipe")
			await Transitions.animation_finished
			get_tree().change_scene_to_file("res://Scenes/loading.tscn")
		else:
			Values.Won = 1
			Values.Level += 1
			Values.LoadableScene = Values.Levels[Values.Level]
			get_tree().paused = false
			Transitions.play("Trianglewipe")
			await Transitions.animation_finished
			get_tree().change_scene_to_file("res://Scenes/loading.tscn")
	else:
		Values.Won = 1
		Values.Level += 1
		if Values.Score > Values.EndlesHi:
			Values.EndlesHi = Values.Score
		Values.LoadableScene = "res://Scenes/main_menu.tscn"
		get_tree().paused = false
		Transitions.play("Trianglewipe")
		await Transitions.animation_finished
		get_tree().change_scene_to_file("res://Scenes/loading.tscn")
	Values.Score = 0 
	Values.Mult = 0
	print("time's up!")


func _on_character_body_2d_add_time() -> void:
	timer.start(timer.time_left + 5)


func _on_button_2_pressed() -> void:
	Values.LoadableScene = "res://Scenes/main_menu.tscn"
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_character_body_2d_lose_time() -> void:
	if timer.time_left >= 6:
		timer.start(timer.time_left - 5)
