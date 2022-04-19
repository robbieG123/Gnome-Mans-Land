extends Node

var day = 1;

func _ready():
	$Player.visible = false
	$Player/Camera2D/Hours/Timer.stop()
	$TitleScreen/Camera2D.current = true


func _on_TitleScreen_new_game():
	print ("start the game")
	$Player.visible = true
	$Player/Camera2D/Hours/Timer.start()
	$TitleScreen.visible = false
	$TitleScreen/Camera2D.current = false
	$Player/Camera2D.current = true
