extends ColorRect

func _ready():
	visible = false

func _on_Controls_pressed():
	visible = true


func _on_Button_pressed():
	visible = false
