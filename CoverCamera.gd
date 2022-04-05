extends ColorRect

signal slept_in_bed()
signal stayed_up()

func _ready():
	visible = false;

func _on_Player_next_day(bed):
	visible = true;
	if bed == "yes":
		emit_signal("slept_in_bed")
	else:
		emit_signal("stayed_up")
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	visible = false;


func _on_Day_next_day(bed):
	pass # Replace with function body.
