extends KinematicBody

const GRAVITY = 4
const SPEED = 4
const JUMP_POWER = 90
const ROTATING = 4

var velocity = Vector3()


func _physics_process(delta):
	
	move_and_collide(Vector3.DOWN * delta * GRAVITY)

	
	check_key_input(delta)
	move_and_slide(velocity)


func check_key_input(delta):
	velocity = Vector3.ZERO
	if Input.is_action_pressed("left"):
		rotate(Vector3.UP, ROTATING * delta)
		#move_and_collide(-transform.basis.x * SPEED * delta)
	
	if Input.is_action_pressed("right"):
		rotate(Vector3.UP, -ROTATING * delta)
		#move_and_collide(transform.basis.x * SPEED * delta)
	
	if Input.is_action_pressed("forward"):
		move_and_collide(-transform.basis.z * SPEED * delta)
	
	if Input.is_action_pressed("back"):
		move_and_collide(transform.basis.z * SPEED * delta)
		
	if Input.is_action_just_pressed("jump"):
		move_and_collide(transform.basis.y * JUMP_POWER * delta)
		
	if Input.is_action_just_pressed("Spawn_Bombe"):
		spawn()
	
func spawn():
	var bombe_klein = preload("res://Scenes/Objekts/Bombe_klein.tscn")
	print("HA")
	var bombe1 = bombe_klein.instance()
	bombe1.transform.origin.x = global_transform.origin.x
	bombe1.transform.origin.y = global_transform.origin.y + 0.005
	bombe1.transform.origin.z = global_transform.origin.z  
	add_child(bombe1)
	
	

	
