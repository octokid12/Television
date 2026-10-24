extends Node2D

var progress: Array[float] = []

@onready var Announcer = $Announcer

var Loading: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Loading = false
	Transitions.play_backwards("Trianglewipe")
	
	match Values.LoadableScene:
		"res://Scenes/Endless/Endless.tscn":
			$Portrait.play("endless")
		"res://Scenes/Levels/level.tscn":
			$Portrait.play("Stage1")
		"res://Scenes/Levels/level2.tscn":
			$Portrait.play("Stage2")
		"res://Scenes/Levels/level3.tscn":
			$Portrait.play("Stage3")
	
	
	if Values.Won == 0:
		Announcer.play("Onward")
	elif Values.Won == -1:
		Announcer.play("loss")
	elif Values.Won == 1:
		Announcer.play("Win")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_accept") and not Loading:
		#print("j")
		Loading = true
		$Done.visible = false
		$Loading.visible = true
		ResourceLoader.load_threaded_request(Values.LoadableScene)
	
	if Loading:
		var status = ResourceLoader.load_threaded_get_status(Values.LoadableScene, progress)
		
		match status:
			ResourceLoader.THREAD_LOAD_IN_PROGRESS:
				pass
			ResourceLoader.THREAD_LOAD_LOADED:
				var scene = ResourceLoader.load_threaded_get(Values.LoadableScene)
				get_tree().change_scene_to_packed(scene)
				Transitions.play_backwards("Trianglewipe")
