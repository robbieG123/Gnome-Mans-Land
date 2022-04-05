extends Node2D

signal next_day(bed);
signal sleep_time()

func _on_Hours_next_day(bed):
	emit_signal("next_day", bed);
	print ("hours next day")


func _on_Player_next_day(bed):
	if bed == "yes":
		emit_signal("sleep_time");
		print ("time for sleeping")
