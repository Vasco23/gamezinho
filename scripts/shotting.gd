extends Area2D

@export var parent : CharacterBody2D = null
@onready var animated_sprite_2d = $"../AnimatedSprite2D"
const Bullets = preload("res://bullets.tscn")


func _ready():
	area_entered.connect(_on_area_entered)	
	

func _process(delta):
	var range : float = 30
	if (scale.x < range):
		scale.x += 0.1
		scale.y += 0.1
	else:
		parent.is_shooting = false
		animated_sprite_2d.speed_scale = 1

#func _on_area_entered(area : Area2D):
	#print("aqui")
	#if area is Hitbox_badguys:
		#parent.is_shooting = true
		#shootrange.scale.x = 0.1
		#shootrange.scale.y = 0.1
	
func _on_area_entered(area):
	animated_sprite_2d.flip_h = false
	print("ola1")
	if area is Hitbox_badguys:
		if (!parent.is_dash or !parent.is_death):
			print("ola2")
			parent.is_shooting = true
			var bullets = Bullets.instantiate()
			bullets.global_position = %gun.global_position
			add_child(bullets)
			shoot_animated(area)
		scale.x = 0.1
		scale.y = 0.1
		
func shoot_animated(area):
	var main_char = get_node("../../main_char")
	animated_sprite_2d.play("shot")
	animated_sprite_2d.speed_scale = main_char.atack_speed
	if area.global_position < main_char.position:
		animated_sprite_2d.flip_h = true
		
 
