class_name BasicMovementComponent
extends ComponentPrefab


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var _mouse_input : bool = false
var _mouse_rotation : Vector3
var _rotation_input : float
var _tilt_input : float
var _player_rotation : Vector3
var _camera_rotation : Vector3


func unhandled_input(_event: InputEvent) -> void:
	pass


func physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * delta
	
	# Jumpingda
	if Input.is_action_just_pressed("cc_jump") and parent.is_on_floor():
		parent.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("cc_left", "cc_right", "cc_forward", "cc_backward")
	var direction := (parent.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		parent.velocity.x = direction.x * SPEED
		parent.velocity.z = direction.z * SPEED
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, SPEED)
		parent.velocity.z = move_toward(parent.velocity.z, 0, SPEED)

	parent.move_and_slide()
	pass


func cam_movement(delta)->void:
	
	pass
