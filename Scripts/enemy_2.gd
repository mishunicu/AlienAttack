extends Area2D

signal died

@export var speed = 1000

func _physics_process(_delta):
	global_position.x += -speed * _delta

func die():
	emit_signal("died")
	queue_free()
	

func _on_body_entered(body):
	body.take_damage()
	die()
