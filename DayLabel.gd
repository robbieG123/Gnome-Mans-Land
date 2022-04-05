extends Label

var day = 1;
	
func _ready():
	text = ('Day: 1');
	
func _on_Day_next_day(bed):
	day = day+1;
	print ("next day");
	var showDay = String(day);
	text = ('Day: ' + showDay);	
	print ("increase!");


func _on_Day_sleep_time():
	day = day+1;
	print ("next day");
	var showDay = String(day);
	text = ('Day: ' + showDay);	
	print ("increase!");
