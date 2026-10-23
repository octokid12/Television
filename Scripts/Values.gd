extends Node

var endless: bool = false

var Level: int = 0

var Levels: Array = [
	"res://Scenes/Levels/level.tscn",
	"res://Scenes/Levels/level2.tscn"
]


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
