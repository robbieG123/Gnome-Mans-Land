extends GridContainer

var inventory = preload("res://Inventory.tres")

func _ready():
	inventory.connect("item_changed", self, "_on_items_changed")
	
	update_inventory_display()
	
func update_inventory_display():
	for item_index in inventory.items.size():
		update_inventory_slot_display(item_index)

func update_inventory_slot_display(item_index):
	var inventorySlotDisplay = get_child(item_index)
	var item = inventory.items[item_index]
	inventorySlotDisplay.display_item(item)
	
func _on_items_changed(indexes):
	for item_index in indexes:
		update_inventory_slot_display(item_index)


func _on_InventoryContainer_add_to_inventory(item):
	var i = 0;
	var newItem = true;
	while i < inventory.items.size():
		if inventory.items[i] != null:
			if inventory.items[i].name == item:
				newItem = false;
				print ("Add quantity Item")
				if (item == "Carrot"):
					inventory.items[i].quantity +=1
					print (inventory.items[i].quantity)
				update_inventory_display();
				return
		i = i+1
	if newItem == true:
		var t = 0;
		while t < inventory.items.size():
			if inventory.items[t] == null:
				print ("Add new Item")
				if (item == "Carrot"):
					inventory.items[t] = preload("res://Items/ItemLoc/Carrot.tres")
				update_inventory_display();
				return
			t = t+1
