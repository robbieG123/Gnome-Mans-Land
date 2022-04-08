extends Label

var coins = 25

func _ready():
	update_coins()


	
func update_coins():
	var playerCoins = String(coins);
	text = ('Coins: ' + playerCoins);


func _on_PlayerInventory_edit_coins(price_coins, editType):
	if editType == "add":
		coins += price_coins
	elif editType == "remove":
		coins -= price_coins
	update_coins()
