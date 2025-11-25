class_name SimplePlayerController
extends ComponentPrefab


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.5
const TILT_LOWER_LIMIT := deg_to_rad(-90.0)
const TILT_UPPER_LIMIT := deg_to_rad(90.0)

#FIXME 
@export var cam_controller: Node3D


var temp_mouse_input: Vector2
var mouse_rotation := Vector2(0.0,0.0)

func physics_process(delta: float, owner: Node3D) -> void:
	character_movement(delta,owner)
	cam_movement(delta, owner)


func unhandled_input(event: InputEvent, _owner:Node3D) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		temp_mouse_input = Vector2(event.screen_relative.x,event.screen_relative.y)
		#print(temp_mouse_input)


func _input(event, _owner:Node3D):
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func character_movement(delta: float, owner: Node3D) -> void:
	
	if not owner == Human:
		return
		
	# Add the gravity.
	if not owner.is_on_floor():
		owner.velocity += owner.get_gravity() * delta
	
	# Jumpingda
	if Input.is_action_just_pressed("cc_jump") and owner.is_on_floor():
		owner.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("cc_left", "cc_right", "cc_forward", "cc_backward")
	var direction := (owner.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		owner.velocity.x = direction.x * SPEED
		owner.velocity.z = direction.z * SPEED
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, SPEED)
		owner.velocity.z = move_toward(owner.velocity.z, 0, SPEED)

	owner.move_and_slide()
	pass



func cam_movement(delta: float,owner: Node3D)->void:
	
	mouse_rotation.x += -temp_mouse_input.x * MOUSE_SENSITIVITY * delta
	mouse_rotation.y += -temp_mouse_input.y * MOUSE_SENSITIVITY * delta
	mouse_rotation.y = clamp(mouse_rotation.y, TILT_LOWER_LIMIT, TILT_UPPER_LIMIT)
	
	var player_rotation = Vector3(0.0,mouse_rotation.x,0.0)
	var camera_rotation = Vector3(mouse_rotation.y,0.0,0.0)
	
	cam_controller.transform.basis = Basis.from_euler(camera_rotation)
	cam_controller.rotation.z = 0.0
	
	owner.global_transform.basis = Basis.from_euler(player_rotation)
	
	temp_mouse_input.x = 0.0
	temp_mouse_input.y = 0.0
	pass
