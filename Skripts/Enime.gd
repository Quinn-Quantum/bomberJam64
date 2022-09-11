extends KinematicBody


#const GRAVITY = 4
const SPEED = 60
var alive = true
var point1 = Vector3(5,0,0)
var point2 = Vector3(-5,0,0)
var move = true


func _physics_process(delta):
	if !alive:
		return
		
	
	#only check every 10 frems	
	if int(round(delta)) % 10== 0:
		#only change of direction when one of the two points is reached
		if int(round(global_transform.origin.x)) >= point1.x:
			move = true
		if int(round(global_transform.origin.x)) <= point2.x:
			move = false	
	if move:
		move_left(delta)
	else :
		move_right(delta)
		
	
	
func get_bombit():
	alive = false
	
func move_left(delta):
		move_and_slide_with_snap(Vector3.LEFT * SPEED * delta, Vector3(0,1,0))

func move_right(delta):
		move_and_slide_with_snap(Vector3.RIGHT * SPEED * delta, Vector3(0,1,0))
