extends Node2D

signal next_day(bed);	
signal next_hour()
signal sleep_time();	


func _on_Label_next_day(bed):
	emit_signal("next_day", bed);


func _on_Player_next_day(bed):
	if bed == "yes":
		emit_signal("sleep_time");


func _on_Timer_timeout():
	emit_signal("next_hour")
