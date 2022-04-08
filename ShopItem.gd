extends ColorRect


#var carrotSeed = preload("res://Items/ItemArt/CarrotPack.png")
var shop = preload("res://Shop.tres")

onready var itemTextureRect = $ItemTextureRect
onready var itemPrice = $Price
onready var itemName = $Name
onready var button = $BuyButton
var current_item

signal buy_item(item)

func _ready():
	button.visible = false
	visible = false
	
func display_item(item):
	if item is Item:
		current_item = item
		visible = true
		button.visible = true
		itemTextureRect.texture = item.texture	
		var price = String(item.price);
		itemPrice.text = price
		var name = String(item.name);
		itemName.text = name
	else:
		visible = false
		button.visible = false
		rect_scale = Vector2(0, 0)
	
func _on_TextureButton_buy_item():
	print (current_item.name)
	emit_signal("buy_item", current_item)
