extends KinematicBody2D

var velocity = Vector2()
var speed

func _physics_process(delta):
	
	$AnimatedSprite.playing = true
	
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
		$AnimatedSprite.animation = "down"
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite.animation = "up"
	elif Input.is_action_pressed("move_right"):
		$AnimatedSprite.animation = "right"
	elif Input.is_action_pressed("move_left"):
		$AnimatedSprite.animation = "left"
	
	
	if velocity.y == 0 && velocity.x == 0:
		$AnimatedSprite.playing = false
		
		
		
	if Input.is_action_pressed("sprint"):
		speed = 400.0
	else:
		speed = 200.0
		
	var move = move_and_slide(velocity, Vector2.ZERO)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		
		var map = collision.collider.name
		print (map)
		

	
	
	
	
