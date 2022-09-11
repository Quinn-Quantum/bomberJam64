extends KinematicBody

func _physics_process(delta):
	if Input.is_action_pressed("throw") and G.bombeIsInHands:
		move_bombe(delta)
	
func move_bombe(delta):
	move_and_slide(Vector3.FORWARD * 300)
	G.bombeIsInHands = false
	G.bombeLand = true
