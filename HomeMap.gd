extends TileMap

signal plant_map(x, y, plant);
signal harvest_map(x, y);
signal grow(watered);
signal pick_up(plant);


var watered = []

func _on_Player_plow(pos_x, pos_y):
	set_cell (pos_x, pos_y, 4);


func _on_Player_water(pos_x, pos_y):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == 4):
		set_cell (pos_x, pos_y, 3);
		watered.append(pos_x);
		watered.append(pos_y);
	

func _on_Player_plant(pos_x, pos_y, plant):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == 4 || tile_index == 3):
		emit_signal("plant_map", pos_x, pos_y, plant);


func _on_Player_next_day():
	emit_signal("grow", watered);
	var n = 0;
	while (n+1) < watered.size():
		var x = watered[n]
		var y = watered[n+1]
		set_cell (x, y, 4);
		n = n+2
	watered.clear()


func _on_Player_scythe(pos_x, pos_y):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == 4 || tile_index == 3):
		emit_signal("harvest_map", pos_x, pos_y);


func _on_PlantedPlants_harvested(plant):
	emit_signal("pick_up", plant)
