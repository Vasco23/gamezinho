extends Node2D

@onready var parent = $".."
@onready var death_h = $"../death_handler"


func _take_hit(value : int):
	var main_char = get_node("../../main_char")
	var new_health : int = parent.curr_health - main_char.atack_damage
	if new_health <= 0:
		if (death_h == null):
			print("error not defined")
			return
		death_h.handle_death.emit()
	else:
		parent.curr_health = new_health
