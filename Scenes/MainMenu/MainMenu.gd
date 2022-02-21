extends Control

onready var scoreLabel = $VBox/HBox/HighScore

func _ready():
	scoreLabel.text = str(MANAGER.hScore)
