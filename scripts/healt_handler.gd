class_name health_handler
extends Node

@export var parent : CharacterBody2D = null

#signal heal
signal heal(value : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	heal.connect(_healing)

func _healing(value : int):
	if parent == null:
		print("error: no parent")
		return
	if parent.curr_health <= 0:
		return
	parent.curr_health += value
