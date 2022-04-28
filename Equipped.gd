extends Sprite

var inventory = preload("res://Inventory.tres")
signal plow()
signal water()
signal scythe()
signal plant(plant)
signal update_inventory()


func _physics_process(_delta):
	var currentItem = inventory.items[0]
	if (currentItem != null):
		texture = inventory.items[0].texture;
		if Input.is_action_pressed("move_down"):
			position.x = -43.182
			position.y = 34.091
			rotation_degrees = 0;
			flip_h = false;
		elif Input.is_action_pressed("move_up"):
			position.x = -43.182
			position.y = 34.091
			rotation_degrees = 0;
			flip_h = false;
		elif Input.is_action_pressed("move_right"):
			position.x = -2.273
			position.y = 31.818
			rotation_degrees = 90
			flip_h = false;
		elif Input.is_action_pressed("move_left"):
			position.x = -13.636
			position.y = 36.364
			rotation_degrees = -90
			flip_h = true;
			
		if (Input.is_action_just_pressed("use_item")):
			if (currentItem.name == "Hoe"):
				emit_signal("plow");
			elif (currentItem.name == "WateringCan"):
				emit_signal("water");
			elif (currentItem.name == "CarrotSeeds" && currentItem.quantity > 0):

				emit_signal("plant", "carrot");
			elif (currentItem.name == "PotatoSeeds" && currentItem.quantity > 0):

				emit_signal("plant", "potato");
			elif (currentItem.name == "TomatoSeeds" && currentItem.quantity > 0):

				emit_signal("plant", "tomato");
			elif (currentItem.name == "Scythe"):
				print ("scythe")
				emit_signal("scythe");
	else:
		texture = null;

func _on_Player_remove_seed(plant):
	var seedToRemove
	var i = 0
	if plant == 'carrot':

		seedToRemove = 'CarrotSeeds'
	elif plant == 'potato':

		seedToRemove = 'PotatoSeeds'
	elif plant == 'tomato':

		seedToRemove = 'TomatoSeeds'
		
	while i < inventory.items.size():
		if inventory.items[i] != null:
			if inventory.items[i].name == seedToRemove:

				inventory.items[i].quantity -= 1
		i += 1
	emit_signal("update_inventory")
		


func _on_ShopContainer_buy_item(item):
	pass # Replace with function body.
