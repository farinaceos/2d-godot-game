extends Area2D

@onready var timer = $Timer



func _on_body_entered(body):
	if body.has_method("heal"):
		body.heal()
	queue_free()
	
func _on_timer_timeout():
	queue_free()
