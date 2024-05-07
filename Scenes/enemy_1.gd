extends Area2D

@export var speed = 300

func _physics_process(_delta):
	global_position.x += -speed*_delta

func die():
	queue_free()

func _on_body_entered(body):
	body.take_damage()
	die()

