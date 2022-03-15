extends KinematicBody2D

signal plow(pos_x, pos_y)

var velocity = Vector2()
var speed

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
		
	var move = move_and_slide(velocity, Vector2.ZERO)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		var map = collision.collider.name
		print (map)
		
func _on_Equipped_plow():
	var x = position.x
	var y = position.y
	x = x/64;
	y = y/64;
	x = stepify(x, 1);
	y = stepify(y, 1);
	print ("plow!");
	emit_signal("plow", x, y);
