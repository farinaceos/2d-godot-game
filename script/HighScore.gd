extends Label

func _process(delta):
	self.text = "High Score: " + str(GameManager.highScore)
