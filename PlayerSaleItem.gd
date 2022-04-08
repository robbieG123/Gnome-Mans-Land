extends ColorRect


var inventory = preload("res://Inventory.tres")

onready var itemTextureRect = $ItemTextureRect
onready var itemPrice = $itemPrice
onready var itemName = $itemName
onready var button = $TextureButton
var current_item
var quantity


signal sell_item(item)
signal update_shop()

func _ready():
	button.visible = false
	visible = false

func display_item(item, item_quantity):
	if item is Item && item_quantity > 0:
		quantity = item_quantity
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
	
func _on_TextureButton_sell_item():
	print (quantity)
	if quantity == 1:
		print ("selling: ", current_item.name)
		emit_signal("sell_item", current_item)
		quantity -= 1
		visible = false
	elif quantity > 0:
		print ("selling: ", current_item.name)
		emit_signal("sell_item", current_item)
		quantity -= 1
	else:
		print ("cant sell no more!")
		emit_signal("update_shop")
