extends TextureButton

var uniqueID
var cardID
var initPos

func _ready():
	rect_global_position = initPos
	var tex = str("res://Sprites/", cardID, ".png")
	texture_pressed = load(tex)
