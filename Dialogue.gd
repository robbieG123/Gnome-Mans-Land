extends ColorRect

onready var dialogue = $Dialogue
signal speak(text)
signal finished_speech()

	
func _ready():
	visible = false

	
func _on_Player_speak(character, quest):
	visible = true
	var dialogueLength = 6
	var speech
	var repeat = false
	var name = "Nobby"
	
	if character == 'Barry':
		if quest == 0:
			speech = "Alright "+ name + ". I'm your uncle Barry. Your mum was my little sister. Such a shame what happened to your mum and dad..."
			repeat = true
		elif quest == 1:
			speech = "Anyway, nevermind that for now. Its great that you've moved back to the village. Bet you hardly remember this place do you?"
			repeat = true
		elif quest == 2:
			speech = "This is where your mum and dad grew up. They met and fell in love here, then had you and decided to move away to a human's garden for a more peaceful life."
			repeat = true
		elif quest == 3:
			speech = "So, enough backstory. Guess you I'll need to teach you how to farm!"
			repeat = true
		elif quest == 4:
			speech = "First, to equip an item. Press Tab to open your inventory then drag and drop your desired item to equip into the top left box. Start by equipping your hoe"
			repeat = true
		elif quest == 5:
			speech = "Once your hoe's equipped. Press Space on a tile of land to plow it"
			repeat = true
		elif quest == 6:
			speech = "Once you've plowed the grass, go into your inventory with Tab. Then equip some seeds and plant them on the tile with Space. I've started you off with some carrots"
			repeat = true
		elif quest == 7:
			speech = "Once they're planted you'll need to equip your watering can to water them. You'll have to water them everyday until they're fully grown"
			repeat = true
		elif quest == 8:
			speech = "You can sleep in your house by pressing 'E' on it to skip to the next day"
			repeat = true
		elif quest == 9:
			speech = "Come back to me once you've got 8 carrots"
		elif quest == 10:
			speech = "You brought me the carrots! Well done little one, we'll make a gnome farmer of you yet!"
			repeat = true
		elif quest == 11:
			speech = "Now I want you to take these carrots and sell them at the shop, with that money you can buy whatever seeds you want."
			repeat = true
		elif quest == 12:
			speech = "Come back to me once you have 5 Tomato's, 5 Potato's and 5 Carrots. Now leave me alone, I've got business to attend to"
		
	
	
	elif character == 'Egbert':
		if quest == 0:
			speech = "Hi I'm Egbert. But my friends call me eggy. You should stay close to me, I'm kind of the Alpha round these parts."
			
	elif character == 'Annie':
		if quest == 0:
			speech = "Hey there I'm Annie, the only lady gnome in the village. We're all so happy to have you here. You should go find Barry if you haven't already."
	
	emit_signal('speak', speech)
	
	var t = Timer.new()
	t.set_wait_time(dialogueLength)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	if repeat == true:
		quest += 1
		print(quest)
		_on_Player_speak(character, quest)
	else:
		visible = false
		emit_signal("finished_speech")
