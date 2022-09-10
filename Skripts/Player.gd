extends KinematicBody

#const area
const GRAVITY = 4
const SPEED = 4
const JUMP_POWER = 90
const ROTATING = 4
#var area
var bombeIsInHands = false
#func area
func _physics_process(delta):
	#When player is in the air
	move_and_collide(Vector3.DOWN * delta * GRAVITY)
	
	check_key_input(delta)

func check_key_input(delta):
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
	#Check if a bomb is already held
	if !bombeIsInHands :
		var bombe_klein = preload("res://Scenes/Objekts/Bombe_klein.tscn")
		var var2 = 0.6
		var bombe1 = bombe_klein.instance()
		#only y has to be adjusted, otherwise the player is taken as the starting point
		bombe1.transform.origin.y = var2
		add_child(bombe1)
		print(bombe1.transform.origin)
		bombeIsInHands = true
	
	

	
