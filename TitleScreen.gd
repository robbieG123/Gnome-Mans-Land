extends Node2D

signal new_game() 

func _ready():
	pass

func _on_NewGame_pressed():
	emit_signal("new_game")


func _process(_delta):
	if Input.is_action_just_pressed("escape") && visible == false:
		visible = true
		$Camera2D.current = true
		$HomeScreen/NewGame/Label.text = "Resume"
	elif Input.is_action_just_pressed("escape"):
		visible = false
		$Camera2D.current = false
