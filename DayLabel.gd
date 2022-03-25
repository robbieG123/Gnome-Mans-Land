extends Label

var day = 1;
	
func _ready():
	text = ('Day: 1');
	
func _on_Day_next_day():
	day = day+1;
	print ("next day");
	var showDay = String(day);
	text = ('Day:' + showDay);			
	print ("increase!");
