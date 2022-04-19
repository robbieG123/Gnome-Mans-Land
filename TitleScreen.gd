extends Node2D

signal new_game() 


func _on_NewGame_pressed():
	emit_signal("new_game")
