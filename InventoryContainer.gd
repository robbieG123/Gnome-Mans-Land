extends TextureRect

var open = false;
signal edit_inventory(item, editType)
signal remove_from_inventory(item)
signal update_inventory()
signal edit_coins(coins, editType)

var current_coins = 25

func _process(delta):
	if Input.is_action_just_pressed("inventory_open"):
		if open == true:
			self.visible = false;
			open = false;
		else:
			self.visible = true;
			open = true;
			


func _on_Player_pick_up(plant):
	emit_signal("edit_inventory", plant, "add")
	


func _on_Equipped_update_inventory():
	emit_signal("update_inventory")

func _add_coins(money):
	current_coins += money
	
func _remove_coins(money):
	current_coins -= money

func _on_ShopContainer_buy_item(item):
	if current_coins - item.price >= 0:
		emit_signal("edit_coins", item.price, "remove")
		emit_signal("edit_inventory", item.name, "add")
		current_coins -= item.price


func _on_ShopContainer_sell_item(item):
	emit_signal('edit_coins', item.price, "add")
	emit_signal("edit_inventory", item.name, "remove")
	current_coins += item.price
