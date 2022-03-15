extends GridContainer

var inventory = preload("res://Inventory.tres")

func _ready():
	inventory.connect("item_changed", self, "_on_items_changed")
	
	update_inventory_display()
	
func update_inventory_display():
	print ("update inv display")
	for item_index in inventory.items.size():
		update_inventory_slot_display(item_index)

func update_inventory_slot_display(item_index):
	print ("update inv slot display")
	var inventorySlotDisplay = get_child(item_index)
	var item = inventory.items[item_index]
	inventorySlotDisplay.display_item(item)
	
func _on_items_changed(indexes):
	print ("items changed")
	for item_index in indexes:
		update_inventory_slot_display(item_index)
