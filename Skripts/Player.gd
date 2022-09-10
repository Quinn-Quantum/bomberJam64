extends KinematicBody


const GRAVITY = 4
const SPEED = 4
const JUMP_POWER = 90
const ROTATING = 4


func _ready():
	pass

func _process(delta):
	
	move_and_collide(Vector3.DOWN * delta * GRAVITY)

	
	check_key_input(delta)


func check_key_input(delta):
	
	if Input.is_action_pressed("left"):
		rotate(Vector3.UP, ROTATING * delta)
		move_and_collide(-transform.basis.x * SPEED * delta)
	
	if Input.is_action_pressed("right"):
		rotate(Vector3.UP, -ROTATING * delta)
		move_and_collide(transform.basis.x * SPEED * delta)
	
	if Input.is_action_pressed("forward"):
		move_and_collide(-transform.basis.z * SPEED * delta)
	
	if Input.is_action_pressed("back"):
		move_and_collide(transform.basis.z * SPEED * delta)
		
	if Input.is_action_just_pressed("jump"):
		move_and_collide(transform.basis.y * JUMP_POWER * delta)
	
