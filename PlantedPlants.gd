extends TileMap

var carrots = []
signal harvested(plant)

func _on_HomeMap_plant_map(x, y, plant):
	if (plant == "carrot"):
		if get_cell(x, y) == INVALID_CELL:
			set_cell(x, y, 0);
			carrots.append(x);
			carrots.append(y);


func _on_HomeMap_grow(watered):
	var n = 0;
	print ("planted ", carrots)
	print ("watered ", watered)
	while (n+1) < carrots.size():
		var x = carrots[n]
		var y = carrots[n+1]
		if same_cell(x, y, watered):
			if get_cell(x, y) == 0:
				set_cell(x, y, 1);
			elif get_cell(x, y) == 1:
				set_cell(x, y, 2);
		n = n+2;

func same_cell(x, y, array2):
	print ("attempting a match!");
	var n = 0;
	while (n+1) < array2.size():
		if x == array2[n]:
			print ("x match")
			if y == array2[n+1]:
				print ("y match")
				return true;
		n = n+2;
	return false;


func _on_HomeMap_harvest_map(x, y):
	if get_cell(x, y) == 2:	#carrot!
		set_cell(x, y, -1)
		emit_signal("harvested", "Carrot")

