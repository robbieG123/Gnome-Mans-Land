extends TextureRect

var open = false;
signal add_to_inventory(item)

func _process(delta):
	if Input.is_action_just_pressed("inventory_open"):
		if open == true:
			self.visible = false;
			open = false;
		else:
			self.visible = true;
			open = true;
			


func _on_Player_pick_up(plant):
	emit_signal("add_to_inventory", plant)
	
