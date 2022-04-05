extends Label

func _ready():
	visible = false;
	
func _on_CoverCamera_slept_in_bed():
	visible = true;
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	visible = false;
