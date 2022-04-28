extends TileMap

var planted = []
var Day1 = []
var Day2 = []

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
	print ("Day1 ", Day1)
	print ("Day2 ", Day2)
	while (n+1) < planted.size():
		var x = planted[n]
		var y = planted[n+1]
		if same_cell(x, y, watered):
			#Carrots
			if get_cell(x, y) == 0:
				set_cell(x, y, 1);
			elif get_cell(x, y) == 1:
				set_cell(x, y, 2);
			#Potatoes
			elif get_cell(x, y) == 3:
				if same_cell(x, y, Day1):
					set_cell(x, y, 4)
					_remove_planted(x, y, Day1)
				else:
					Day1.append(x)
					Day1.append(y)
			elif get_cell(x, y) == 4:
				if same_cell(x, y, Day2):
					set_cell(x, y, 5)
					_remove_planted(x, y, Day2)
				else:
					Day2.append(x)
					Day2.append(y)
			#Tomatos
			elif get_cell(x, y) == 6:
				if same_cell(x, y, Day1):
					set_cell(x, y, 7)
					_remove_planted(x, y, Day1)
				else:
					Day1.append(x)
					Day1.append(y)
			elif get_cell(x, y) == 7:
				set_cell(x, y, 8);
		n = n+2;
	

func same_cell(x, y, array2):
	var n = 0;
	while (n+1) < array2.size():
		if x == array2[n]:
			if y == array2[n+1]:
				return true;
		n = n+2;
	return false;


func _on_HomeMap_harvest_map(x, y):
	print (x, y)
	if get_cell(x, y) == 2:	#carrot!
		set_cell(x, y, -1)
		emit_signal("harvested", "Carrot")
		_remove_planted(x, y, planted)
	elif get_cell(x, y) == 5:	#potato!
		set_cell(x, y, -1)
		emit_signal("harvested", "Potato")
		_remove_planted(x, y, planted)
	elif get_cell(x, y) == 8:	#tomato!
		set_cell(x, y, -1)	
		emit_signal("harvested", "Tomato")
		_remove_planted(x, y, planted)

			

func _remove_planted(x, y, array):
	var n = 0;
	while (n+1) <= array.size():
		if (x == array[n]):
			if (y == array[n+1]):
				array.remove(n)
				array.remove(n)
				return
		n+=2
