extends TileMap


func _on_Player_plow(pos_x, pos_y):
	var tile_index = get_cell(pos_x, pos_y);
	set_cell (pos_x, pos_y, 4);
