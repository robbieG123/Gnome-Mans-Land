extends TextureRect

signal buy_item(item)
signal sell_item(item)

onready var playerSale = $PlayerSaleDisplay

func _ready():
	visible = false

func update_sale():
	playerSale.update_to_sell()


func _on_ShopItem_buy_item(item):
	print ("2", item.name)
	emit_signal("buy_item", item)


func _on_PlayerSaleItem_sell_item(item):
	print ("2", item.name)
	emit_signal("sell_item", item)

