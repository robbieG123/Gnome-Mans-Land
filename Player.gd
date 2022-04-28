extends KinematicBody2D

signal plow(pos_x, pos_y)
signal water(pos_x, pos_y)
signal scythe(pos_x, pos_y)
signal plant(pos_x, pos_y, plant)
signal pick_up(plant)
signal next_day(bed)
signal remove_seed(plant)
signal speak(character, quest)
signal finished_speech()
signal bridge()
signal remove_egg()
signal next_hour()

onready var shop = $Camera2D/ShopContainer
onready var inventory = $Inventory/PlayerInventory/CenterContainer/InventoryDisplay

var velocity = Vector2()
var speed
var home_x = (100)
var home_y = (100)
var barryQuest = 0
var egbertQuest = 0
var annieQuest = 0
var finkleQuest = 0
var test = false
var shopOpen = false

func _ready():
	$Equipped.visible = true
	$CollisionShape2D.visible = true
	#$Camera2D.visible = true

func _physics_process(delta):
	var sprite = $AnimatedSprite;
	sprite.playing = true
	
		
	
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
	else: 
		velocity.x = 0	
			
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	elif Input.is_action_pressed("move_up"):
		velocity.y = -speed
	else:
		velocity.y = 0
		
	if Input.is_action_pressed("move_down"):
		sprite.animation = "down"
	elif Input.is_action_pressed("move_up"):
		sprite.animation = "up"
	elif Input.is_action_pressed("move_right"):
		sprite.animation = "right"
	elif Input.is_action_pressed("move_left"):
		sprite.animation = "left"
	
	if Input.is_action_just_pressed("interact") && shop.visible == true:
		shop.visible = false
		
	if Input.is_action_just_pressed("escape"):
		$Camera2D.current = true
	
	if velocity.y == 0 && velocity.x == 0:
		sprite.playing = false
	else:
		if $Audio/Walk.playing == false:
			$Audio/Walk.play()
			

		
	if Input.is_action_pressed("sprint"):
		speed = 400.0
	else:
		speed = 200.0
	
	var stop = false;
	if Input.is_action_pressed("use_item"):
		pass
	elif (stop == false):
		var move = move_and_slide(velocity, Vector2.ZERO)
		for index in get_slide_count():
			var collision = get_slide_collision(index)
			var map = collision.collider.name
			#print (map)
			if Input.is_action_just_pressed("interact"):
				pass
			if Input.is_action_just_pressed("interact") && map == "HomeBody":
				position.x = home_x;
				position.y = home_y;
				emit_signal("next_day", "yes");
			if Input.is_action_just_pressed("interact"):
				if map == "ShopBody":
					if shopOpen == true:
						shop.visible = false
						shopOpen = false
					elif shopOpen == false:
						print ("open")
						shop.update_sale()
						shop.visible = true
						shopOpen = true
						
			if Input.is_action_just_pressed("interact") && map == "Egg":
				$Inventory/PlayerInventory/CenterContainer/InventoryDisplay._on_InventoryContainer_edit_inventory('Egg', 'add')
				emit_signal('remove_egg')	
					#NPC Interactions
			if Input.is_action_just_pressed("interact") && map == "Barry": #Barry Quest Checker
				if barryQuest == 4 && inventory._check_inventory("Carrot", 8):
					barryQuest = 10
					emit_signal('speak', 'Barry', barryQuest)
					barryQuest = 12
				elif barryQuest == 12 && inventory._check_inventory("Carrot", 5) && inventory._check_inventory("Potato", 5) && inventory._check_inventory("Tomato", 5):
					barryQuest = 13
					emit_signal('speak', 'Barry', barryQuest)
					barryQuest = 19
				elif barryQuest == 4:
					emit_signal('speak', 'Barry', barryQuest)
				elif barryQuest == 0:
					emit_signal('speak', 'Barry', barryQuest)
					barryQuest = 4
				elif barryQuest == 19:
					if (inventory._check_inventory("Carrot", 50) && inventory._check_inventory("Potato", 50) && inventory._check_inventory("Tomato", 50)) || test == true:
						barryQuest = 20
						emit_signal('speak', 'Barry', barryQuest)
					else:
						emit_signal('speak', 'Barry', barryQuest)
				else:
					emit_signal('speak', 'Barry', barryQuest)
				$Audio/Barry.play()
				
			if Input.is_action_just_pressed("interact") && map == "Egbert": #Egbert Quest Checker
				if egbertQuest == 0:
					emit_signal('speak', 'Egbert', egbertQuest)
					egbertQuest = 1
				elif egbertQuest == 1:
					emit_signal('speak', 'Egbert', egbertQuest)
					egbertQuest = 3
				elif egbertQuest == 3:
					if inventory._check_inventory("Egg", 1):
						egbertQuest = 4
						emit_signal('speak', 'Egbert', egbertQuest)
						$Camera2D/Coins/CoinsLabel.coins += 50
						$Camera2D/Coins/CoinsLabel.update_coins()
						$Inventory/PlayerInventory/CenterContainer/InventoryDisplay._on_InventoryContainer_edit_inventory('Egg', 'remove')
					else:
						emit_signal('speak', 'Egbert', egbertQuest)
				$Audio/Egbert.play()
				
				
			if Input.is_action_just_pressed("interact") && map == "Annie": #Annie Quest Checker
				print (annieQuest)
				if annieQuest == 0:
					emit_signal('speak', 'Annie', annieQuest)
					annieQuest = 1
				elif annieQuest == 1:
					emit_signal('speak', 'Annie', annieQuest)
					annieQuest = 6
				elif annieQuest == 6:
					if $Camera2D/Coins/CoinsLabel.coins > 200:
						emit_signal('speak', 'Annie', 7)
						$Camera2D/Coins/CoinsLabel.coins -= 200
						$Camera2D/Coins/CoinsLabel.update_coins()
						emit_signal('bridge')
						annieQuest = 8
					else:
						emit_signal('speak', 'Annie', annieQuest)
				$Audio/Annie.play()
				
			if Input.is_action_just_pressed("interact") && map == "Finkle": #Annie Quest Checker
				if finkleQuest == 0:
					emit_signal('speak', 'Finkle', finkleQuest)
					finkleQuest = 2
				elif finkleQuest == 2:
					emit_signal('speak', 'Finkle', finkleQuest)
					finkleQuest = 8
				elif finkleQuest == 8:
					emit_signal('speak', 'Finkle', finkleQuest)
					finkleQuest = 14
				elif finkleQuest == 14:
					emit_signal('speak', 'Finkle', finkleQuest)
				else:
					emit_signal('speak', 'Finkle', finkleQuest)
				$Audio/Finkle.play()
						
				
			
	



func _get_position():
	var x = position.x - 50;
	var y = position.y
	x = x/64;
	y = y/64;
	x = stepify(x, 1);
	y = stepify(y, 1);
	return [x, y];

func _on_Equipped_plow():
	var pos = _get_position();
	var x = pos[0];
	var y = pos[1];
	emit_signal("plow", x, y);
	$Audio/Plow.play()

func _on_Equipped_water():
	var pos = _get_position();
	var x = pos[0];
	var y = pos[1];
	emit_signal("water", x, y);	
	if $Audio/Water.playing == false:
			$Audio/Water.play()


func _on_Equipped_plant(plant):
	var pos = _get_position();
	var x = pos[0];
	var y = pos[1];
	emit_signal("plant", x, y, plant);
	if $Audio/Planting.playing == false:
			$Audio/Planting.play()


func _on_Day_next_day(bed):
	position.x = home_x;
	position.y = home_y;
	emit_signal("next_day", bed);


func _on_Equipped_scythe():
	var pos = _get_position();
	var x = pos[0];
	var y = pos[1];
	emit_signal("scythe", x, y);
	if $Audio/Harvest.playing == false:
			$Audio/Harvest.play()


func _on_HomeMap_pick_up(plant):
	emit_signal("pick_up", plant)



func _on_HomeMap_remove_seed(plant):
	emit_signal("remove_seed", plant)


func _on_DialogueBox_finished_speech():
	emit_signal("finished_speech")


func _on_Hours_next_hour():
	emit_signal('next_hour')



