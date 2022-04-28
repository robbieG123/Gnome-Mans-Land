extends TextureButton

signal buy_item()

func _ready():
	var button = Button.new()
	button.text = "Buy Now!"
	button.connect("pressed", self, "_button_pressed")
	add_child(button)
	
func _button_pressed():
	emit_signal("buy_item")
	$BuyAudio.play()
