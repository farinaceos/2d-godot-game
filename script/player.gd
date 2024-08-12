extends CharacterBody2D

signal health_depleted

var max_health = 100.0
var health = max_health
const SPEED = 600

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * SPEED
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_RATE = 12.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		%ProgressBar.max_value = max_health 
		if health > max_health:
			max_health = health
		if health <= 0.0:
			health_depleted.emit()

func heal():
	if health > max_health:
		max_health = health
	health += 50
	print(health)
	%ProgressBar.max_value = max_health 
	%ProgressBar.value = health
