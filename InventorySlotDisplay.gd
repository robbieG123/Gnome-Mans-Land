extends CenterContainer

var inventory = preload("res://Inventory.tres")
signal item_quantity(quantity)

onready var itemTextureRect = $ItemTextureRect

func display_item(item):
	if item is Item && item.quantity > 0:
		itemTextureRect.texture = item.texture	
		emit_signal("item_quantity", item.quantity)
	else:
		itemTextureRect.texture = load("res://Assets/Items/empty.png")
		emit_signal("item_quantity", 0)
		
func get_drag_data(_position):
	var item_index = get_index()
	var item = inventory.items[item_index]
	if item is Item:
		var data = {}
		data.item = item
		data.item_index = item_index
		var dragPreview = TextureRect.new()
		dragPreview.texture = item.texture
		set_drag_preview(dragPreview)
		return data
	
func can_drop_data(_position, data):
	return data is Dictionary and data.has("item")
	
func drop_data(_position, data):
	var my_item_index = get_index()
	var my_item = inventory.items[my_item_index]
	inventory.swap_items(my_item_index, data.item_index)
	inventory.set_item(my_item_index, data.item)
