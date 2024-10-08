extends Node2D

@onready var player = $Player

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


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
	
func _on_quit_button_pressed():
	get_tree().quit()

func _on_dif_timer_timeout():
	print("Difficulty UP!")
	print($SpawnTimer.wait_time)
	print($Player/Gun/Timer.wait_time)
	$SpawnTimer.wait_time -= 0.09
	$Player/Gun/Timer.wait_time += 0.09
	print($SpawnTimer.wait_time)
	print($Player/Gun/Timer.wait_time)
