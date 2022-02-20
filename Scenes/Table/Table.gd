extends Control

var card = preload("res://Objects/Cards/Card.tscn")

#DECK
var cList :Array = []
var fTotal :int

#CARDS POSITION
var initPos = Vector2(0,100)
var currentPos = Vector2.ZERO
var grid = Vector2.ZERO

#DIFFICULTY
enum{EASY, MEDIUM, HARD, EXTREME}
var mode

#RULES


func _ready():
	randomize()
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
	cList.shuffle()

func _deal_cards():
	var c :int = 0
	currentPos.y = 0
	
	for y in grid.y:
	#CREATE DECK BASED ON GRID SIZE
		currentPos.x = 0
		if(y > 0):
			currentPos.y += 250
		for x in grid.x:
			cList[c].initPos = currentPos
			$Deck.add_child(cList[c])
			c += 1
			currentPos.x += 200
	
	#CENTRALIZE
	var deckCenter = Vector2.ZERO
	deckCenter.x = (currentPos.x - 60) / 2
	deckCenter.y = (currentPos.y + 60) / 2
	var center = get_rect().size / 2
	$Deck.position = center - deckCenter

func _set_difficulty():
	mode = MEDIUM
	match mode:
		EASY:
			grid = Vector2(4,2)
		MEDIUM:
			grid = Vector2(4,4)
		HARD:
			grid = Vector2(6,5)
		EXTREME:
			grid = Vector2(8,5)
	
	fTotal = grid.x * grid.y / 2
