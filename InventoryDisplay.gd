extends GridContainer

var inventory = preload("res://Inventory.tres")
var allItems = []

func _ready():
	var path = "res://Items/ItemLoc/"
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif !file_name.begins_with("."):
			#get_next() returns a string so this can be used to load the images into an array.
			allItems.append(load(path + file_name))
	dir.list_dir_end()
	
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
	$InventoryMove.play()
	for item_index in indexes:
		update_inventory_slot_display(item_index)


func _on_InventoryContainer_update_inventory():
	update_inventory_display()


func _on_InventoryContainer_edit_inventory(item, editType):
	var i = 0;
	var newItem = true;
	while i < inventory.items.size():
		if inventory.items[i] != null:
			if inventory.items[i].name == item:
				newItem = false;
				if editType == "add":
					print ("Add quantity Item")
					inventory.items[i].quantity +=1
				elif editType == "remove":
					print ("Remove quantity Item")
					inventory.items[i].quantity -=1
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
					print ("carrot")
					inventory.items[t] = preload("res://Items/ItemLoc/Carrot.tres")
				elif (item == "Potato"):
					print ("Potato")
					inventory.items[t] = preload("res://Items/ItemLoc/Potato.tres")
				elif (item == "Tomato"):
					print ("Tomato")
					inventory.items[t] = preload("res://Items/ItemLoc/Tomato.tres")
				elif (item == "Egg"):
					print ("Egg add")
					inventory.items[t] = preload("res://Items/ItemLoc/Egg.tres")
				update_inventory_display();
				return
			t = t+1
			
func _check_inventory(item, quantity):
	var i = 0
	while i < inventory.items.size():
		if inventory.items[i] != null:
			if inventory.items[i].name == item:
				print ("present!")
				if inventory.items[i].quantity >= quantity:
					print ("enough")
					return true
		i += 1
	return false
