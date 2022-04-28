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
			speech = "So, enough backstory. Guess I'll need to teach you how to farm!"
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
		elif quest == 13:
			speech = "I'm very impressed! you truly are your fathers son. Me and him were the best potato farmers this village had ever seen. Maybe our title will be taken from us by you!"
			repeat = true
		elif quest == 14:
			speech = "You might be wondering about the giant trees that surround us. Or as the human's call them, 'trees'. None of us ever enter those woods as there's all sorts of creatures that dwell within"
			repeat = true
		elif quest == 15:
			speech = "John got swept away by the current once and had to make his way back through the giant trees. 4 days he was gone. once he returned he spoke of goblins and spiders. Hasn't been the same since"
			repeat = true
		elif quest == 16:
			speech = "Now he spends his time strolling the beach but never goes in the water in case he's swept away again..."
			repeat = true
		elif quest == 17:
			speech = "But I'm sure it was all his mind playing tricks on him. The goblins haven't been seen for centuries. Ever since the human's wiped them out in the great war."
			repeat = true
		elif quest == 18:
			speech = "If you want to learn more about gnome lore I recommend you speak to Finkle. He's the oldest out of all of us and has remembered countless stories of days past."
			repeat = true
		elif quest == 19:
			speech = "I have another farming challenge for you. If you can bring me 50 of each crop I'll be able to give you something special"
		elif quest == 20:
			speech = "You actually did it? Jesus H Gnomes, you're a bloody good farmer. Ummm I'm sorry I don't actually have anything for you..."
			repeat = true
		elif quest == 21:
			speech = "I didn't think you'd actually do it... Maybe you should just keep farming and someone will come along and get you something"
	elif character == 'Egbert':
		if quest == 0:
			speech = "Hi I'm Egbert. But my friends call me eggy. You should stay close to me, I'm kind of the Alpha round these parts. Oh yeah... Barry's looking for you"
		elif quest == 1:
			speech = "You don't happen to have seen an egg lying about somewhere? I really need it and I can't find it anywhere"
			repeat = true
		elif quest == 2:
			speech = "If you find it I would reward you... Not that you would be able to find it before me anyway."
		elif quest == 3:
			speech = "Come back when you found my egg you useless gnome."
		elif quest == 4:
			speech = "You actually found it? Whatever... I suppose I will give you a reward then. Here's some money that I got from selling eggs"
		
		
	elif character == 'Annie':
		if quest == 0:
			speech = "Hey there I'm Annie, the only lady gnome in the village. We're all so happy to have you here. You should go find Barry if you haven't already."
		elif quest == 1:
			speech = "I hope you're settling in ok. I'm sure Barry's caught you up to speed. We always need fresh fruits and vegetables in the village so you'll definitely always be in demand"
			repeat = true
		elif quest == 2:
			speech = "I've lived here all my life and I've always wanted to do up the village a bit, starting with building a bridge over to the west side of town."
			repeat = true
		elif quest == 3:
			speech = "I don't want to be cheeky but you don't think you could help me out do you? Of course not! Unless...?"
			repeat = true
		elif quest == 4:
			speech = "I'd need 200 coins to pay a builder gnome to construct it. I really think it would help out the village and let us know what is over there!"
			repeat = true
		elif quest == 5:
			speech = "You'll help? Oh "+ name +"you are the best! Thank you so much!."
		elif quest == 6:
			speech = "I need 200 coins for this bridge"
		elif quest == 7:
			speech = "Oh my! You actually got the money, I'm impressed. We can now start building the bridge thanks so much!"
			
			
	elif character == 'Finkle':
		if quest == 0:
			speech = "Well met, "+ name + ". I am Finkle, the oldest gnome in the village and it's designated keeper and distributer of the lore!"
			repeat = true
		elif quest == 1:
			speech = "Should you wish to know about the history of the village and gnomes in general. Please just ask, I need someone to take over so I can die."
		elif quest == 2:
			speech = "aaaaah so you are a gnome with a thirst for knowledge. Very well then, let me pour you a glass of history!"
			repeat = true
		elif quest == 3:
			speech = "The gnomes in this village are all direct descendants of the ancient ones, including yourself "+name+". The ancient ones date back thousands of years, to when gnomes were first moulded in the fire of the earth." 
			repeat = true
		elif quest == 4:
			speech = "It is said the first gnome, known as Rob. Is the one link all gnomes have in common as he is the initial creator and forefather of gnome-kind"
			repeat = true
		elif quest == 5:
			speech = "Many gnomes have theorised about the origin of Rob. Some say he was harvested off the branch of a tree. Others say he fell from the sky."
			repeat = true
		elif quest == 6:
			speech = "Hogwash if you ask me. Personally, I believe he was always here. No creation nor destruction, just a gnome thats always been. There's talk of his return to appoint his heir."
			repeat = true
		elif quest == 7:
			speech = "They say only a gnome true of heart and talented of farm can become the true son of Rob. Who knows, maybe it will be you! Come back if you want to hear more talk of gnome history"
		elif quest == 8:
			speech = "You have returned for more. Very well, open your ears and your mind young one..."
			repeat = true
		elif quest == 9:
			speech = "Stories of old say that Rob wandered the earth searching for the best place to live as a gnome. He found no luck, the world was too wide and diverse he could not decide."
			repeat = true
		elif quest == 10:
			speech = "So he had an idea. He created a gnome in all biomes of the world. First, he created Mountain gnomes, they are the tallest of our kind but keep to themselves."
			repeat = true
		elif quest == 11:
			speech = "Then he created Beach gnomes. John is a beach gnome, they can bury themselves beneath the sand to escape predators and are keen fishers."
			repeat = true
		elif quest == 12:
			speech = "Then he created us. The Forest gnomes, to which he took a strong liking to and spent the rest of his days dwelling with."
			repeat = true
		elif quest == 13:
			speech = "And then he created... Never mind. That's a story for another day, come back again and I'll tell you."
		elif quest == 14:
			speech = "You're back. A curious young gnome you are. They say Rob was the most curious"
			repeat = true
		elif quest == 15:
			speech = "I left you on a hanger last time. I will finish what I started then."
			repeat = true
		elif quest == 16:
			speech = "The final gnomes to be created were the Volcano gnomes or as they are known, Volcagnomes. Rob had gotten old and bored. He wanted to experiment."
			repeat = true
		elif quest == 17:
			speech = "The Volcagnomes were masters of lava and heat. They could start fires by just rubbing their hands together. This made them very respected in the gnome community"
			repeat = true
		elif quest == 18:
			speech = "But it wasnt enough. They wanted more... Krakatogi, the leader of the Volcagnomes convinced them to attack the beach gnomes and take their sandy lands."
			repeat = true
		elif quest == 19:
			speech = "Luckily, the beach gnomes could hide amongs the sand which stopped them being wiped out. It didn't stop the ransacking and overtaking of their kingdom."
			repeat = true
		elif quest == 20:
			speech = "They fled to all corners of the world as refugees from the Volcagnomes. That's how John came to be here"
			repeat = true
		elif quest == 21:
			speech = "Rob died shortly after he created the Volcagnomes and did not live to see their descent into evil. His heir is said to be the one to defeat them and return us to harmony"
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
