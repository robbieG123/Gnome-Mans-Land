extends TileMap

signal plant_map(x, y, plant);

func _on_Player_plow(pos_x, pos_y):
	set_cell (pos_x, pos_y, 4);


func _on_Player_water(pos_x, pos_y):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == 4):
		set_cell (pos_x, pos_y, 3);
	

func _on_Player_plant(pos_x, pos_y, plant):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == 4 || tile_index == 3):
		emit_signal("plant_map", pos_x, pos_y, plant);
