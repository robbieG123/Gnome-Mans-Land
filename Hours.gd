extends Node2D

signal next_day();	


func _on_Label_next_day():
	print ('next!');
	emit_signal("next_day");
