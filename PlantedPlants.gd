extends TileMap



func _on_HomeMap_plant_map(x, y, plant):
	if (plant == "carrot"):
		set_cell(x, y, 0);
