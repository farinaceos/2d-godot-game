extends Node

# Scores for Endgame Screen
var score = 0
var highScore = 0

# Mobs Values
var mobMaxHealth = 3
var mobSpeed = 300.00
var spawnRate = 1.0

# Getters and Setters for Mob values

func setMaxHealth(NewMobHealth: int):
	mobMaxHealth = NewMobHealth;
func getMaxHealth():
	return mobMaxHealth;
func setMobSpeed(NewMobSpeed: float):
	mobSpeed = NewMobSpeed;
func getMobSpeed():
	return mobSpeed;
func setSpawnRate(NewSpawnRate: float):
	spawnRate = NewSpawnRate;

