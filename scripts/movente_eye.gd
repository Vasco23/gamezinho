extends Node

@export var parent : CharacterBody2D = null
@onready var animated_sprite_2d = $"../AnimatedSprite2D"

func _move(main_pos):
	var dir : Vector2 = main_pos - parent.position
	dir = dir.normalized()
	parent.velocity = dir * parent.speed
	if (parent.velocity.x != 0 or parent.velocity.y != 0) and animated_sprite_2d.is_playing() == false:
		animated_sprite_2d.play("default")
	var is_left = parent.velocity.x < 0
	animated_sprite_2d.flip_h = is_left

func _physics_process(delta):
	var main_char = get_node("../../main_char")
	if main_char == null:
		return
	var main_pos = Vector2()
	main_pos = main_char.position
	parent.velocity.x = 0
	parent.velocity.y = 0
	_move(main_pos)
	parent.move_and_slide()
