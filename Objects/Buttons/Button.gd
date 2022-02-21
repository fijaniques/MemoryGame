extends Button

var scene :PackedScene
enum{EASY, MEDIUM, HARD, EXTREME}

func _on_Button_pressed():
	scene = load("res://Scenes/MainMenu/MainMenu.tscn")
	if(name == "Play"):
		if(MANAGER.dif == null):
			scene = load("res://Scenes/Difficulty/Difficulty.tscn")
		else:
			scene = load("res://Scenes/Table/Table.tscn")
	elif(name == "Main Menu"):
		scene = load("res://Scenes/MainMenu/MainMenu.tscn")
	elif(name == "Difficulty"):
		scene = load("res://Scenes/Difficulty/Difficulty.tscn")
	elif(name == "EASY"):
		MANAGER.dif = EASY
	elif(name == "MEDIUM"):
		MANAGER.dif = MEDIUM
	elif(name == "HARD"):
		MANAGER.dif = HARD
	elif(name == "EXTREME"):
		MANAGER.dif = EXTREME
	else:
		get_tree().quit()
	
	get_tree().change_scene_to(scene)
