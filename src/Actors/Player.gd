extends Actor


func _physics_process(delta):
	var direction: = getDirection()
	velocity = calculateMoveVelocity(velocity, direction, speed)
	velocity = move_and_slide(velocity, Vector2.UP)


func getDirection() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump")  else 1.0
	)

func calculateMoveVelocity(
		linearVelocity: Vector2, direction: Vector2, speed: Vector2
	) -> Vector2: 
	var newVelocity = linearVelocity
	
	newVelocity.x = speed.x * direction.x
	
	newVelocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1: 
		newVelocity.y = speed.y * direction.y
	
	return newVelocity
	
