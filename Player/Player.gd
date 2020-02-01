extends KinematicBody


signal pick_up

signal put_down

var can_pick_up = false
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
		$ItemPosition.global_transform.translated(Vector3(0,deg2rad(-90),0))
	
	if Input.is_action_pressed("ui_left"):
		velocity.z -= 1	
			
	if Input.is_action_pressed("ui_right"):
		velocity.z += 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		if holding_item:
			$GameJamBoyo/AnimationPlayer.current_animation = "CarryWalkLoop"
		else:	
			$GameJamBoyo/AnimationPlayer.current_animation = "WalkLoop"
	else:
		if holding_item:
			$GameJamBoyo/AnimationPlayer.current_animation = "CarryIdleLoop"
		else:
			$GameJamBoyo/AnimationPlayer.current_animation = "IdleLoop"
	
	if Input.is_action_just_pressed("ui_accept") and can_pick_up and not holding_item:
		emit_signal("pick_up")
		holding_item = true
		can_pick_up = false
		
		print("Pick Up")
	elif Input.is_action_just_pressed("ui_accept") and holding_item:
		emit_signal("put_down")
		holding_item = false
		print("Put Down")
	

	
	move_and_collide(velocity * delta)