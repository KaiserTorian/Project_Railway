class_name BasicMovementComponent
extends ComponentPrefab

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.5
const TILT_LOWER_LIMIT := deg_to_rad(-90.0)
const TILT_UPPER_LIMIT := deg_to_rad(90.0)

@export var cam_controller: Node3D

var temp_mouse_input: Vector2
var mouse_rotation := Vector2(0.0,0.0)

func physics_process(delta: float) -> void:
	character_movement(delta)
	cam_movement(delta)


func unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		temp_mouse_input = Vector2(-event.screen_relative.x * MOUSE_SENSITIVITY,-event.screen_relative.y * MOUSE_SENSITIVITY)
		#print(temp_mouse_input)


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func character_movement(delta: float) ->void:
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
	
	mouse_rotation.x += temp_mouse_input.x * delta
	mouse_rotation.x = clamp(mouse_rotation.x, TILT_UPPER_LIMIT, TILT_UPPER_LIMIT)
	mouse_rotation.y += temp_mouse_input.y * delta
	
	var player_rotation = Vector3(0.0,mouse_rotation.x,0.0)
	var camera_rotation = Vector3(mouse_rotation.y,0.0,0.0)
	print(player_rotation,mouse_rotation.x)
	cam_controller.transform.basis = Basis.from_euler(camera_rotation)
	cam_controller.rotation.z = 0.0
	
	parent.global_transform.basis = Basis.from_euler(player_rotation)
	
	temp_mouse_input.x = 0.0
	temp_mouse_input.y = 0.0
	pass
