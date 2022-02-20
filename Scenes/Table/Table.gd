extends Control

var card = preload("res://Objects/Cards/Card.tscn")
var fList :Array = []
var cList :Array = []
var fTotal :int
var initPos = Vector2(0,100)
var currentPos = Vector2.ZERO
var grid = Vector2.ZERO

enum{EASY, MEDIUM, HARD}
var mode

func _ready():
	currentPos = initPos
	_set_difficulty()
	_create_cards()
	_deal_cards()

func _create_cards():
	for c in fTotal:
		var cInstance = card.instance()
		var cInstance2 = card.instance()
		cInstance.cardID = c + 1
		cInstance2.cardID = c + 1
		cList.append(cInstance)
		cList.append(cInstance2)

func _deal_cards():
	var theCard :int = 0
	for y in grid.y:
		currentPos.x = 200
		currentPos.y += 250
		for x in grid.x:
			currentPos.x += 200
			cList[theCard].initPos = currentPos
			add_child(cList[theCard])
			theCard += 1

func _set_difficulty():
	mode = HARD
	match mode:
		EASY:
			fTotal = 4
			grid = Vector2(4,2)
		MEDIUM:
			fTotal = 10
			grid = Vector2(5,4)
		HARD:
			fTotal = 20
			grid = Vector2(8,5)
