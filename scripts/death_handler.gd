class_name death_handler
extends Node

@export var parent : CharacterBody2D = null
@onready var animated_sprite_2d = $"../AnimatedSprite2D"

signal handle_death

func _ready():
	handle_death.connect(_death)
	
func _death():
	print("dead")
	parent.is_death = true
	animated_sprite_2d.play("death")
	#parent.queue_free()
