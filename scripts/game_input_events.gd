# Class definition
class_name GameInputEvents

static var direction: Vector2

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO: # The player isn't pressing W, A, S or D keys
		return false
	else:
		return true
		
static func movement_input() -> Vector2:
	if Input.is_action_pressed("up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("down"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO # Nothing is pressed, then idle
	
	return direction
