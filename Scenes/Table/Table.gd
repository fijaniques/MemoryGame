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
	for c in cList:
		currentPos += Vector2(200,0)
		c.initPos = currentPos
		add_child(c)

func _set_difficulty():
	mode = EASY
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
