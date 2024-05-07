extends Node2D

var player_life = 3
@onready var player = $Player

func _on_deathzone_area_entered(area):
	area.die()


func _on_player_damage_took():
	player_life -= 1
	if player_life == 0:
		print("game over")
		player.die()
	else:
		print(player_life)
