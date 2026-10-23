extends Node2D

var progress: Array[float] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ResourceLoader.load_threaded_request(Values.LoadableScene)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(Values.LoadableScene, progress)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			pass
		ResourceLoader.THREAD_LOAD_LOADED:
			$Done.visible = true
			var scene = ResourceLoader.load_threaded_get(Values.LoadableScene)
			if Input.is_action_pressed("ui_accept"):
				print("a")
				get_tree().change_scene_to_packed(scene)
