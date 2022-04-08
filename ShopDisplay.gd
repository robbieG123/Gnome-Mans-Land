extends GridContainer

var shop = preload("res://Shop.tres")

func _ready():
	var i = 0
	while i < shop.items.size() && shop.items[i] != null:
		var item = shop.items[i]
		var ShopItem = get_child(i)
		ShopItem.display_item(item)
		i += 1
	

	
