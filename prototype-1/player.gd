extends CharacterBody2D


@export var screen_size : Vector2
var health = 3
var gravity =300
var acceleration =300
var decelleration =800
var max_speed =200


	

func _ready():
	screen_size = get_viewport_rect().size
	health = 3
func _process(delta):
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false



func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
	
func _physics_process(delta):
	if Input.is_action_pressed("move_left"):
		if -velocity.x < max_speed:
			velocity.x -=acceleration*delta
	elif Input.is_action_pressed("move_right"):
		if velocity.x < max_speed:
			velocity.x +=acceleration*delta
	else:
		velocity.x = move_toward(velocity.x,0,decelleration*delta)
	
	if is_on_floor():
		if Input.is_action_pressed("move_up"):
			velocity.y =- 200
	else:
		velocity.y +=gravity*delta
	if velocity.x > 0:
		$Area2D2.scale.x = 1
	if velocity.x < 0:
		$Area2D2.scale.x = -1
	move_and_slide()


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
