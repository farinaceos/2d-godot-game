extends CharacterBody2D

var health = 4
var drop_rate = 0.5
const SPEED = 300.0

# onready function is the same as calling the _ready() function
@onready var player = $"../Player"
const POTION = preload("res://scenes/potion.tscn")

func _ready(): %Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()


func take_damage():
	health -= 1
	%Slime.play_hurt()
	if health == 0:
		
		queue_free()
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		

func _on_slime_tree_exited():
	GameManager.score += 1
	var drop_chance = randf()
	
	if drop_chance > drop_rate:		
		var new_potion = POTION.instantiate()
		new_potion.global_position = $Slime/Anchor/Face/SlimeFace.global_position
		player.get_parent().add_child(new_potion)
		
	#var drop_percent = randf()
	#if drop_percent > drop_rate:
		
