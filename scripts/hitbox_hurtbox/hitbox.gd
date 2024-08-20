class_name Hitbox
extends Area2D

@export var damage_handle : damage_handler = null

signal hit(damage : int)

func _ready():
	hit.connect(_hitbox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _hitbox(damage : int):
	if (damage_handle == null):
		print("error: damage_handler not set")
		return
	print("took ", damage, " damage")
	damage_handle.damage.emit(damage)
