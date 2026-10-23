extends CanvasLayer

@onready var timer = $Timer
@onready var Labeltime = $Time/Time2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
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
	get_tree().set_pause(true)
	print("time's up!")
