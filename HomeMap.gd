extends TileMap

signal plant_map(x, y, plant);
signal harvest_map(x, y);
signal grow(watered);
signal pick_up(plant);
signal remove_seed(plant)
signal speak(character)

onready var paths = $Node2D

var watered = []
var plowedTile = 9
var wetPlowedTile = 10
var hour = 8
var dayColour = 1

func _on_Player_plow(pos_x, pos_y):
	var tile = get_cell(pos_x, pos_y)
	if tile != 1:
		set_cell (pos_x, pos_y, plowedTile);


func _on_Player_water(pos_x, pos_y):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == plowedTile):
		set_cell (pos_x, pos_y, wetPlowedTile);
		watered.append(pos_x);
		watered.append(pos_y);
	

func _on_Player_plant(pos_x, pos_y, plant):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == plowedTile || tile_index == wetPlowedTile):
		emit_signal("plant_map", pos_x, pos_y, plant);


func _on_Player_next_day(bed):
	if bed == "yes":
		hour = 7
	else:
		hour = 9
	dayColour = 1
	emit_signal("grow", watered);
	var n = 0;
	while (n+1) < watered.size():
		var x = watered[n]
		var y = watered[n+1]
		set_cell (x, y, plowedTile);
		n = n+2
	watered.clear()


func _on_Player_scythe(pos_x, pos_y):
	var tile_index = get_cell(pos_x, pos_y);
	if (tile_index == plowedTile || tile_index == wetPlowedTile):
		emit_signal("harvest_map", pos_x, pos_y);


func _on_PlantedPlants_harvested(plant):
	emit_signal("pick_up", plant)


func _on_PlantedPlants_remove_seed(plant):
	emit_signal("remove_seed", plant)


func _on_Player_speak(character, quest):
	$Node2D/Path1/CharacterFollower2D.runSpeed = 0
	$Node2D/Path2/CharacterFollower2D.runSpeed = 0
	$Node2D/Path3/CharacterFollower2D.runSpeed = 0


func _on_Player_finished_speech():
	$Node2D/Path1/CharacterFollower2D.runSpeed = 80
	$Node2D/Path2/CharacterFollower2D.runSpeed = 80
	$Node2D/Path3/CharacterFollower2D.runSpeed = 80


func _on_Player_bridge():
	$Water.set_cell(-16, 5, 4)
	$Water.set_cell(-15, 5, 4)
	$Water.set_cell(-14, 5, 4)
	$Water.set_cell(-16, 4, 4)
	$Water.set_cell(-15, 4, 4)
	$Water.set_cell(-14, 4, 4)
	$Water.set_cell(-16, 6, 4)
	$Water.set_cell(-15, 6, 4)
	$Water.set_cell(-14, 6, 4)
	


func _on_Player_remove_egg():
	$Egg.visible = false


func _on_Player_next_hour():
	hour += 1
	print (hour)
	if hour > 16:
		dayColour -= 0.1
	modulate = Color(dayColour,dayColour,dayColour)
