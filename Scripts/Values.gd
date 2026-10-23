extends Node

var Score: int = 0
var Mult: int = 0

var Target

var PlayerY: int


var LoadableScene: String

func _process(_delta: float) -> void:
	if Mult < 0:
		Mult = 0
