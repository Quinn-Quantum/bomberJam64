extends KinematicBody

func _physics_process(delta):
	if Input.is_action_pressed("throw") and G.bombeIsInHands:
		move_bombe()
	check_for_stomp()
	
	
func move_bombe():
	var player_eye
	for body in $HitBox.get_overlapping_bodies():
		if body.name == "Player":
			player_eye = body.transform.basis.z
	for _i in range(50):
		move_and_slide( - player_eye * 4 )
		move_and_slide(transform.basis.y * - 0.5)
		check_for_stomp()
	G.bombeIsInHands = false
	yield(get_tree().create_timer(0.25), "timeout")
	check_for_stomp()
	G.bombeLand = true


func check_for_stomp():
	
	for body in $HitBox.get_overlapping_bodies():
		if body.name == "Enime":
			body.bombit()
		
			

