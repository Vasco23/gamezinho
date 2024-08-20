extends Node

@export var parent : CharacterBody2D = null
@onready var animated_sprite_2d = $"../AnimatedSprite2D"

const dash_speed : float = 5000
var speed : float = 0

func _move():
	speed = parent.speed
	parent.velocity.y = 0;
	parent.velocity.x = 0;
	if Input.is_action_just_pressed("DASH"):
		if (parent.is_dash == false):
			animated_sprite_2d.play("dash")
			speed = dash_speed
			parent.is_dash = true
	if Input.is_action_pressed("down"):
		parent.velocity.y += speed
	if Input.is_action_pressed("up"):
		parent.velocity.y -= speed
	if Input.is_action_pressed("left"):
		parent.velocity.x -= speed
	if Input.is_action_pressed("right"):
		parent.velocity.x = speed
	if parent.velocity.x != 0 and parent.velocity.y != 0:
		parent.velocity.x /= sqrt(2)
		parent.velocity.y /= sqrt(2)
	parent.move_and_slide()

func _handle_sprites():
	if animated_sprite_2d.is_playing() == false:
		parent.is_dash = false
	if  (parent.is_death or parent.is_shooting == true or parent.is_dash) and animated_sprite_2d.is_playing():
		pass
	elif parent.velocity.x != 0 or parent.velocity.y != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("default")
	if parent.is_shooting:
		return
	var is_left = parent.velocity.x < 0
	animated_sprite_2d.flip_h = is_left
	
func _physics_process(delta):
	if parent.is_death == true:
		return
	_move()
	_handle_sprites()
