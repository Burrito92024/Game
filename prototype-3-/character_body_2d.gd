extends CharacterBody2D
var gravity =300
var acceleration =300
var decelleration =800
var max_speed =200
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if -velocity.x < max_speed:
			velocity.x -=acceleration*delta
	elif Input.is_action_pressed("ui_right"):
		if velocity.x < max_speed:
			velocity.x +=acceleration*delta
	else:
		velocity.x = move_toward(velocity.x,0,decelleration*delta)
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			velocity.y =- 200
	else:
		velocity.y +=gravity*delta
	move_and_slide()

	
