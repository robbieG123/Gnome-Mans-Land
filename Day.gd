extends Node2D

signal next_day();

func _on_Hours_next_day():
	emit_signal("next_day");
