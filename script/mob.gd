extends CharacterBody2D

const SPEED = 300

var player

func _ready():
	player = get_node("root/Game/Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()
