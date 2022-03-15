extends Sprite

var inventory = preload("res://Inventory.tres")

func _physics_process(delta):
	if (inventory.items[0] != null):
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
	else:
		texture = null;
