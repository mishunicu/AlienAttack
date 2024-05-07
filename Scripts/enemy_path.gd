extends Path2D

@onready var pathfollow = $PathFollow2D
@onready var enemy = $PathFollow2D/Enemy_1
# Called when the node enters the scene tree for the first time.
func _ready():
	pathfollow.set_progress_ratio(1)

func _process(_delta):
	pathfollow.progress_ratio -= 0.25 * _delta
	if pathfollow.progress_ratio <= 0:
		queue_free()
