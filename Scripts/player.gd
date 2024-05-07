extends CharacterBody2D


signal damage_took
@onready var shoot_rocket_sound = $RocketShotSound

var speed = 400
var rocket_scene = preload("res://Scenes/rocket.tscn")
@onready var rocket_container = $RocketContainer #get_node("RocketContainer")

#func _ready():
	#rocket_container = get_node("RocketContainer")

func _physics_process(_delta):
	velocity = Vector2(0,0)
	
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	# code to prevent player from going off screen
	#if global_position.x < 0:
		#global_position.x = 0
	#if global_position.x > screen_size.x:
		#global_position.x = screen_size.x
	#if global_position.y < 0:
		#global_position.y = 0
	#if global_position.y > screen_size.y:
		#global_position.y = screen_size.y
	
	# code to prevent player going off screen
	#global_position.x = clampf(global_position.x,0,screen_size.x)
	#global_position.y = clampf(global_position.y,0,screen_size.y)
	
	# one line to prevent player going off screen
	global_position = global_position.clamp(Vector2(0,0), screen_size)
	
func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	shoot_rocket_sound.play()
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 70
				
				
func take_damage():
	emit_signal("damage_took")
	
func die():
	queue_free()
	
	
