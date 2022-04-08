extends Label



func _on_InventorySlotDisplay_item_quantity(quantity):
	if quantity > 0:
		visible = true
		var showQuantity = String(quantity)
		text = showQuantity
	else:
		visible = false
