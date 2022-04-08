extends TileMap

var planted = []

signal harvested(plant)
signal remove_seed(plant)

func _on_HomeMap_plant_map(x, y, plant):
	if get_cell(x, y) == INVALID_CELL:
		if (plant == "carrot"):
			set_cell(x, y, 0);
			planted.append(x);
			planted.append(y);
			emit_signal("remove_seed", plant)
		if (plant == "potato"):
			set_cell(x, y, 3);
			planted.append(x);
			planted.append(y);
			emit_signal("remove_seed", plant)
		if (plant == "tomato"):
			set_cell(x, y, 6);
			planted.append(x);
			planted.append(y);
			emit_signal("remove_seed", plant)



func _on_HomeMap_grow(watered):
	var n = 0;
	print ("planted ", planted)
	print ("watered ", watered)
	while (n+1) < planted.size():
		var x = planted[n]
		var y = planted[n+1]
		if same_cell(x, y, watered):
			if get_cell(x, y) == 0:
				set_cell(x, y, 1);
			elif get_cell(x, y) == 1:
				set_cell(x, y, 2);
			elif get_cell(x, y) == 3:
				set_cell(x, y, 4);
			elif get_cell(x, y) == 4:
				set_cell(x, y, 5);
			elif get_cell(x, y) == 6:
				set_cell(x, y, 7);
			elif get_cell(x, y) == 7:
				set_cell(x, y, 8);
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
		_remove_planted(x, y)
	if get_cell(x, y) == 5:	#potato!
		set_cell(x, y, -1)
		emit_signal("harvested", "Potato")
		_remove_planted(x, y)
	if get_cell(x, y) == 8:	#tomato!
		set_cell(x, y, -1)
		emit_signal("harvested", "Tomato")
		_remove_planted(x, y)
			

func _remove_planted(x, y):
	var n = 0;
	while (n+1) < planted.size():
		if same_cell(x, y, planted):
			print ("removing")
			print (n)
			print (n+1)
			planted.remove(n)
			planted.remove(n+1)
		n+=2
