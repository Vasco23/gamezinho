extends Area2D

@export var parent : CharacterBody2D = null
@onready var animated_sprite_2d = $"../AnimatedSprite2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area : Area2D):
	var main_char = get_node("../../main_char")
	if parent == null:
		print("error: no parent")
		return
	if area is Hitbox:
		if animated_sprite_2d == null:
			print("error: sprite null!")
			return
		if main_char.is_dash == true:
			return
		animated_sprite_2d.play("attack")
		area.hit.emit(parent.damage) #put parent damage here
