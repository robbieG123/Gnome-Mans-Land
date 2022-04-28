extends TextureButton

signal sell_item()

func _ready():
	var button = Button.new()
	button.text = "Sell Now!"
	button.connect("pressed", self, "_button_pressed")
	add_child(button)
	
func _button_pressed():
	emit_signal("sell_item")
	$SellAudio.play()
