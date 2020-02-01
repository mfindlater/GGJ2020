extends KinematicBody


signal pick_up

signal put_down

var holding_item = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export var speed = 100

func _process(delta):

	
	var velocity = Vector3()
	if Input.is_action_pressed("ui_up"):
		velocity.x += 1
	if Input.is_action_pressed("ui_down"):
		velocity.x -= 1
	
	if Input.is_action_pressed("ui_up"):
		$GameJamBoyo.rotation = Vector3.ZERO
	
	if  Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
		$GameJamBoyo.rotation = Vector3(0,deg2rad(45),0)
	
	if  Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		$GameJamBoyo.rotation = Vector3(0,deg2rad(-45),0)
	
	if  Input.is_action_pressed("ui_down"):
		$GameJamBoyo.rotation = Vector3(0,deg2rad(-180),0)
		
	if  Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		$GameJamBoyo.rotation = Vector3(0,deg2rad(135),0)
	
	if  Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		$GameJamBoyo.rotation = Vector3(0,deg2rad(-135),0)
	
	if Input.is_action_pressed("ui_left"):
		$GameJamBoyo.rotation = Vector3(0,deg2rad(90),0)
		
	
	if Input.is_action_pressed("ui_right"):
		$GameJamBoyo.rotation = Vector3(0,deg2rad(-90),0)
	
	if Input.is_action_pressed("ui_left"):
		velocity.z -= 1	
			
	if Input.is_action_pressed("ui_right"):
		velocity.z += 1

	if velocity.length() > 0:
		velocity = velocity.normalized()
		$GameJamBoyo/AnimationPlayer.current_animation = "WalkLoop"
	else:
		$GameJamBoyo/AnimationPlayer.current_animation = "IdleLoop"
		
	
		
	
	move_and_collide(velocity * speed * delta)
