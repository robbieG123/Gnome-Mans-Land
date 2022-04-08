extends Label

signal next_day(bed);

var hour = 9;
func _ready():
	text = ('8:00');		
	
func _on_Timer_timeout():
	var showHour = String(hour);
	text = (showHour + ':00');		
	if (hour < 23):
		hour = hour +1
	else:
		hour = 10;
		text = (showHour + ':00');	
		emit_signal('next_day', "no");
		


func _on_Hours_sleep_time():
	hour = 8


