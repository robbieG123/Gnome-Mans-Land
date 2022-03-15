extends TextureRect

var open = false;

func _process(delta):
	if Input.is_action_just_pressed("inventory_open"):
		if open == true:
			self.visible = false;
			open = false;
		else:
			self.visible = true;
			open = true;
			
