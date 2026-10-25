class_name DangerousObject extends Node2D


@export var Sound: AudioStreamPlayer
@export var Soundframe: int = 0
@export var Sprite: AnimatedSprite2D
@export var SpawnAnimation: String
@export var SpawnOffset: float = 0

@export var Die: bool = false
@export var DeathFrame: int = 0

@export_category("Hitbox Settings")
@export var Hitbox: Area2D
@export var StartingFrame: int
@export var EndingFrame: int



func _ready() -> void:
	await get_tree().create_timer(SpawnOffset).timeout
	Sprite.play(SpawnAnimation)
	
func _process(_delta: float) -> void:
	if Sound:
		if Sprite.frame == Soundframe:
			Sound.play()
			Sound = null
	if not Sprite: return
	if Sprite.frame >= StartingFrame and Sprite.frame <= EndingFrame:
		#Hitbox.monitorable = true
		Hitbox.visible = true
	elif Sprite.frame > EndingFrame:
		#Hitbox.monitorable = false
		Hitbox.visible = false
	if Sprite.frame == DeathFrame and Die:
		queue_free()
