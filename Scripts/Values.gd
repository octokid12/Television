extends Node

var endless: bool = true

var Level: int = 0

var Levels: Array = [
	"res://Scenes/Levels/level.tscn",
	"res://Scenes/Levels/level2.tscn",
	"res://Scenes/Levels/level3.tscn",
	"res://Scenes/Levels/level4.tscn",
	"res://Scenes/Levels/levelfinal.tscn"
	
]


var Highscores: Array[int] = [
	0,
	0,
	0,
	0,
	0
]

var Timers: Array[int] = [
	60,
	40,
	60,
	50,
	100
]

var Targets: Array[int] = [
	300,
	500,
	1000,
	900,
	100
]

var EndlesHi: int = 0

var Score: int = 0
var Mult: int = 0

var Target

var PlayerY: int

var TargetScore:int = 300

var LoadableScene: String

var Won: int = 0


func _process(_delta: float) -> void:
	if Mult < 0:
		Mult = 0
