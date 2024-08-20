extends Area2D

@export var parent : CharacterBody2D
@onready var animated_sprite_2d = $"../AnimatedSprite2D"


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area : Area2D):
	if parent == null:
		print("error: no parent")
		return
	if area is Hitbox_badguys:
		area.hit.emit(parent.damage) #put parent damage here
