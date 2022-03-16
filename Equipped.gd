extends Sprite

var inventory = preload("res://Inventory.tres")
signal plow()
signal water()
signal plant(plant)


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
			
		if (Input.is_action_pressed("use_item")):
			
			
			if (currentItem.name == "Hoe"):
				emit_signal("plow");
			elif (currentItem.name == "WateringCan"):
				emit_signal("water");
			elif (currentItem.name == "CarrotSeeds"):
				emit_signal("plant", "carrot");
	else:
		texture = null;
