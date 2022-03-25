extends KinematicBody2D

signal plow(pos_x, pos_y)
signal water(pos_x, pos_y)
signal scythe(pos_x, pos_y)
signal plant(pos_x, pos_y, plant)
signal pick_up(plant)
signal next_day()

var velocity = Vector2()
var speed
var home_x = (100)
var home_y = (100)

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
	
	
	if velocity.y == 0 && velocity.x == 0:
		sprite.playing = false
		
		
		
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
			print (map)



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


func _on_Equipped_water():
	var pos = _get_position();
	var x = pos[0];
	var y = pos[1];
	emit_signal("water", x, y);	


func _on_Equipped_plant(plant):
	var pos = _get_position();
	var x = pos[0];
	var y = pos[1];
	emit_signal("plant", x, y, plant);


func _on_Day_next_day():
	position.x = home_x;
	position.y = home_y;
	emit_signal("next_day");


func _on_Equipped_scythe():
	var pos = _get_position();
	var x = pos[0];
	var y = pos[1];
	emit_signal("scythe", x, y);


func _on_HomeMap_pick_up(plant):
	emit_signal("pick_up", plant)
