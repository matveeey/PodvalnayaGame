extends "res://Scripts/EntityBehaviour.gd"

var velocity = Vector2()

const SPEED = 100
const GRAVITY = 50
const JUMP = 500
const FLOOR = Vector2(0, -1)

var vertical_motion = Vector2(0, 0)

func _ready():
	pass
	
func _process(delta):
	var direction = Vector2()
	
	if Input.is_action_pressed("move_up"):
		direction += Vector2(0, -1)
	elif Input.is_action_pressed("move_bottom"):
		direction += Vector2(0, 1)
		
	if Input.is_action_pressed("move_left"):
		direction += Vector2(-1, 0)
	elif Input.is_action_pressed("move_right"):
		direction += Vector2(1, 0)
	
	var motion
	motion = direction.normalized() * SPEED
	
	if Input.is_action_pressed("jump") and is_on_floor():
		vertical_motion = Vector2(-1, -1).normalized() * JUMP
		motion += vertical_motion
	
#	if not is_on_floor():
#		vertical_motion = Vector2(1, 1).normalized() * GRAVITY
#		motion += vertical_motion
	
	motion = cartesian_to_isometric(motion)
	velocity = move_and_slide(motion, FLOOR)
		
	
