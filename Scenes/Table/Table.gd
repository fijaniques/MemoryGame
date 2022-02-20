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
		currentPos.x = 0
		if(y > 0):
			currentPos.y += 250
		for x in grid.x:
			cList[c].initPos = currentPos
			$Deck.add_child(cList[c])
			c += 1
			currentPos.x += 200
			
	var deckCenter = Vector2.ZERO
	deckCenter.x = (currentPos.x - 60) / 2
	deckCenter.y = (currentPos.y + 60) / 2
	var center = get_rect().size / 2

	$Deck.position = center - deckCenter
		
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
