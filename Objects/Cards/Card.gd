extends TextureButton

var cardID
var initPos
var used :bool = false
signal card_id

func _ready():
	var tex = str("res://Sprites/", cardID, ".png")
	
	texture_pressed = load(tex)
	texture_disabled = texture_pressed
	rect_global_position = initPos

func _toggled(button_pressed):
	emit_signal("card_id", self)
	
