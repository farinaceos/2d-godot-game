extends Node2D

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
@onready var player = $Player

# TRY TO SPAWN TREES LATER
func spawn_tree():
	var new_tree = preload("res://scenes/pine_tree.tscn").instantiate()
	%TreePathFollow2D.progress_ratio = randf()
	new_tree.global_position = %TreePathFollow2D.global_position
	add_child(new_tree)

func _on_timer_timeout():
	spawn_mob()
	spawn_tree()
	
func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
	if GameManager.score > GameManager.highScore:
		GameManager.highScore = GameManager.score
	

func _on_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	GameManager.score = 0
	
