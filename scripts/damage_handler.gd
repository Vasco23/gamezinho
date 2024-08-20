class_name damage_handler
extends Node

@onready var parent = $".."
@onready var death_h = $"../death_handler"


signal damage(value : int)

func _ready():
	damage.connect(_took_damage)

func _took_damage(value : int):
	var new_health : int = parent.curr_health - value
	if new_health <= 0:
		if (death_h == null):
			print("error not defined")
			return
		death_h.handle_death.emit()
	else:
		parent.curr_health = new_health
