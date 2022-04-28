extends Node2D

signal start_game()

func _ready():
	$Float.play("Float")
	$Text.play("Float")



func _on_Text_animation_finished(anim_name):
	emit_signal("start_game")
