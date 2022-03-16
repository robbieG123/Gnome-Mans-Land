extends Label

signal dayEnd();

var hour = 9;
func _ready():
	text = ('8:00');		

func _on_Timer_timeout():
	
	print ("recieved");
	var showHour = String(hour);
	text = (showHour + ':00');			
	print ("increase!");
	if (hour < 23):
		hour = hour +1
	else:
		hour = 0;
