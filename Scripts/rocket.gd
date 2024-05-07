extends Area2D

# the @export property let's you display the speed in the properties of the object
@export var rocket_speed = 300
@onready var visible_notifier = $Visiblenotifier

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	global_position.x += rocket_speed*_delta

func _on_screen_exited():
	queue_free()
#func _on_visiblenotifier_screen_exited():
	pass # Replace with function body.


func _on_area_entered(area):
	queue_free()
	area.die() #function from enemy script
