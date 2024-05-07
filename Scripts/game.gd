extends Node2D

var player_life = 3
var score = 0
@onready var player = $Player
@onready var hud = $UI/HUD

func _ready():
	hud.set_score_label(score)
	hud.set_lives_left(player_life)

func _on_deathzone_area_entered(area):
	area.die()


func _on_player_damage_took():
	player_life -= 1
	hud.set_lives_left(player_life)
	if player_life == 0:
		print("game over")
		player.die()
	else:
		print(player_life)


func _on_enemy_spawn_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 25
	hud.set_score_label(score)
