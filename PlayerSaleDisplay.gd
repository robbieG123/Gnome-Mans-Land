extends GridContainer

var inventory = preload("res://Inventory.tres")

func _ready():
	var i = 0
	while i < inventory.items.size():
		var item = inventory.items[i]
		var saleItem = get_child(i)
		saleItem.display_item(item)
		i += 1
