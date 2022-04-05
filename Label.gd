extends Label

signal next_day(bed);

var hour = 9;
func _ready():
	text = ('8:00');		

func _on_Timer_timeout():
	var showHour = String(hour);
	text = (showHour + ':00');		
	if (hour == 0):
		emit_signal('next_day', "no");
		hour = 6;
	if (hour < 23):
		hour = hour +1
	else:
		hour = 0;


func _on_Hours_sleep_time():
	hour = 6
