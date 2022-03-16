extends Node

signal next_day();

func _on_Hours_dayEnd():
	emit_signal("next_day")
