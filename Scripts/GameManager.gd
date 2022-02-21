extends Node

var setScore :int = 0 setget _set_score
var score :int = 0
var hScore :int = 0

enum{EASY, MEDIUM, HARD, EXTREME}
var dif

func _set_score(value):
	score += value
	if(score <= 0):
		score = 0
