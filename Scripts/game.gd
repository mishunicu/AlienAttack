extends Node2D

var player_life = 3
var score = 0
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
var game_over_scene = preload("res://Scenes/game_over_screen.tscn")
@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_is_hit = $PlayerHitSound

func _ready():
	hud.set_score_label(score)
	hud.set_lives_left(player_life)

func _on_deathzone_area_entered(area):
	area.queue_free()


func _on_player_damage_took():
	player_is_hit.play()
	player_life -= 1
	hud.set_lives_left(player_life)
	if player_life == 0:
		print("game over")
		player.die()
		
		await get_tree().create_timer(1.5).timeout
		
		var gos = game_over_scene.instantiate()
		gos.set_score(score)
		ui.add_child(gos)
	else:
		print(player_life)


func _on_enemy_spawn_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 25
	hud.set_score_label(score)
	enemy_hit_sound.play()

func _on_enemy_spawn_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
	
