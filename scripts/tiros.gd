extends Area2D

const max_dist = 3000
var dist = 0

func _physics_process(delta):
	var dir = Vector2.RIGHT.rotated(rotation)
	position += dir * 200 * delta
	dist += 200 * delta
	if dist > max_dist:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_hit"):
		body.take_hit()
	
