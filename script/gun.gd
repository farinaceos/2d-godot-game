extends Area2D


# Original aiming function - deprecated in 08/12
#func _physics_process(delta):
	#var enemies_in_range = 	get_overlapping_bodies().map(position_from_array)
	#if enemies_in_range.size() > 0:
		#var target_enemy = enemies_in_range.front()
		#look_at(target_enemy.global_position)
		
# YOL's aiming function -> Using lambda to always aim the closest mobs
func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies().map(position_from_array)
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		for enemy in enemies_in_range:
			if enemy.distance_to(global_position) < target_enemy.distance_to(global_position):
				target_enemy = enemy
		look_at(target_enemy)
		
		
func position_from_array(enemy):
	return enemy.global_position

func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation

	%ShootingPoint.add_child(new_bullet)
	

func _on_timer_timeout():
	shoot()
