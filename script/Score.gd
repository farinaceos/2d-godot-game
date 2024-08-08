extends Label

func _process(delta):
	self.text = str(GameManager.score) + " Points"
