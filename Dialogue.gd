extends ColorRect

onready var dialogue = $Dialogue
signal speak(text)

func _ready():
	visible = false

func _on_Player_speak(character, quest):
	visible = true
	print ("cum")
	if character == 'Barry':
		if quest == 0:
			emit_signal('speak', 'hey mate its me barry')
	
	elif character == 'Egbert':
		if quest == 0:
			emit_signal('speak', 'hey mate its me egbert')
	
	elif character == 'Annie':
		if quest == 0:
			emit_signal('speak', 'hey mate its me annie')
