extends ColorRect

func _ready():
	visible = false;

func _on_Player_next_day():
	visible = true;
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	visible = false;
