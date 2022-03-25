extends Label

signal next_day();

var hour = 9;
func _ready():
	text = ('8:00');		

func _on_Timer_timeout():
	
	var showHour = String(hour);
	text = (showHour + ':00');		
	if (hour == 0):
		emit_signal('next_day');
		hour = 6;
	if (hour < 23):
		hour = hour +1
	else:
		hour = 0;
